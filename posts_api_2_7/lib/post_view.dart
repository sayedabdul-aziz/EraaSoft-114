import 'package:flutter/material.dart';
import 'package:posts_api_2_7/api_services.dart';
import 'package:posts_api_2_7/post_model/post_model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ApiServices.getPostsByDio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  PostModel post = snapshot.data![index];
                  return ListTile(
                    leading: Text(post.id.toString()),
                    title: Text(post.title.toString()),
                    subtitle: Text(post.body.toString()),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.length);
          } else if (snapshot.hasError) {
            return const Text('errror');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
