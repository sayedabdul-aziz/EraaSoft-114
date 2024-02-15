import 'package:dio/dio.dart';
import 'package:insights_news_2_11/core/constants/app_constants.dart';
import 'package:insights_news_2_11/features/home/data/news_model/news_model.dart';
import 'package:insights_news_2_11/features/source/source_model/source_model.dart';

class ApiServices {
  // getByCategory
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}country=us&category=$category&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // getBySearch
  static Future<NewsModel?> getNewsBySearch(String searchkey) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}country=us&q=$searchkey&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  // getBySource
  static Future<NewsModel?> getNewsBySource(String source) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}country=us&source=$source&apiKey=${AppConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  //
  static Future<SourceModel?> getSources(String source) async {
    try {
      var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines/sources?apiKey=48b16be6252e45a1a3a491c5c6496d72');
      if (response.statusCode == 200) {
        SourceModel news = SourceModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
