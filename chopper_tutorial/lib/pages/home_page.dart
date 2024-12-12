import 'dart:convert';

import 'package:chopper_tutorial/common/page_navigation_animation.dart';
import 'package:chopper_tutorial/data/posts_data/post_api_service.dart';
import 'package:chopper_tutorial/models/posts_model.dart';
import 'package:chopper_tutorial/pages/view_comments_page.dart';
import 'package:chopper_tutorial/pages/view_single_post_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chopper Fetched Data"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => navigateToNewPage(
              context,
              navigateToPage: const ViewCommentsPage(),
            ),
            child: const Text("View All Comments"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // The JsonPlaceholder API always responds with whatever was passed in the POST request.
          final response = await Provider.of<PostApiService>(
            context,
            listen: false,
          ).postPost({"key": "value"});

          // Since we cannot actually add new posts using the PlaceHolder API,
          // we are going to print the response.
          debugPrint(response.bodyString);
        },
        child: const Icon(Icons.add),
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final posts = jsonDecode(snapshot.data!.bodyString);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final eachPost = PostsModel.fromMap(posts[index]);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Material(
                    elevation: 3.0,
                    child: ListTile(
                      shape: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      title: Text(
                        "${eachPost.id}. ${eachPost.title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        eachPost.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        color: Colors.blue,
                        onPressed: () => navigateToNewPage(
                          context,
                          navigateToPage: ViewSinglePostPage(
                            postId: eachPost.id,
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: Text(snapshot.error.toString()),
        );
      },
    );
  }
}
