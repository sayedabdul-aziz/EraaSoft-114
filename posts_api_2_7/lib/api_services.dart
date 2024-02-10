import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:posts_api_2_7/core/constants.dart';
import 'package:posts_api_2_7/post_model/post_model.dart';

class ApiServices {
  static Future<List<PostModel>?> getPosts() async {
    // 1) parse Url
    // 2) get data using http
    //3) check status code (200 ok)
    //4) parse body  from string to json using jsonDecode
    // 5) parse list<map> to list <model> and return it;
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.postsEndpoint);
      var res = await http.get(url);
      if (res.statusCode == 200) {
        // parsing
        List data = jsonDecode(res.body) as List;
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<List<PostModel>?> getPostsByDio() async {
    // 1) parse Url
    // 2) get data using http
    //3) check status code (200 ok)
    //4) parse body  from string to json using jsonDecode
    // 5) parse list<map> to list <model> and return it;
    try {
      var res =
          await Dio().get(ApiConstants.baseUrl + ApiConstants.postsEndpoint);
      if (res.statusCode == 200) {
        // parsing
        List data = (res.data) as List;
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
