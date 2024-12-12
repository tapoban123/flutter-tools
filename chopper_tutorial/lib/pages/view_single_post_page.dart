import 'dart:convert';

import 'package:chopper_tutorial/data/comments_data/comments_api_service.dart';
import 'package:chopper_tutorial/data/posts_data/post_api_service.dart';
import 'package:chopper_tutorial/models/comments_model.dart';
import 'package:chopper_tutorial/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewSinglePostPage extends StatefulWidget {
  final int postId;
  const ViewSinglePostPage({
    super.key,
    required this.postId,
  });

  @override
  State<ViewSinglePostPage> createState() => _ViewSinglePostPageState();
}

class _ViewSinglePostPageState extends State<ViewSinglePostPage> {
  ValueNotifier<bool> showComments = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post ${widget.postId}"),
        centerTitle: true,
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PostApiService>(context).getPost(widget.postId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final post =
              PostsModel.fromMap(jsonDecode(snapshot.data!.bodyString));

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: ValueListenableBuilder(
              valueListenable: showComments,
              builder: (context, showCommentsValue, child) => Column(
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    post.body,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  showCommentsValue
                      ? Expanded(
                          flex: 8,
                          child: FutureBuilder(
                            future: Provider.of<CommentsApiService>(context)
                                .getSingleComment(widget.postId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                final comments =
                                    jsonDecode(snapshot.data!.bodyString);

                                return ListView.builder(
                                  itemCount: comments.length,
                                  itemBuilder: (context, index) {
                                    final comment =
                                        CommentsModel.fromMap(comments[index]);
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Material(
                                        child: ListTile(
                                          shape: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          title: Text(comment.body),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                    flex: showCommentsValue ? 1 : 0,
                    child: ElevatedButton(
                      onPressed: () {
                        showComments.value = !showComments.value;
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50)),
                      child: Text(
                          "${showCommentsValue ? "Hide" : "Show"} Comments"),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(
          child: Text(snapshot.data?.bodyString ?? "An error occurred."),
        );
      },
    );
  }
}
