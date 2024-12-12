import 'dart:convert';

import 'package:chopper_tutorial/data/comments_data/comments_api_service.dart';
import 'package:chopper_tutorial/models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCommentsPage extends StatelessWidget {
  const ViewCommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        centerTitle: true,
      ),
      body: _bodyContent(context),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CommentsApiService>(context).getAllComments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final comments = jsonDecode(snapshot.data!.bodyString);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final eachComment = CommentsModel.fromMap(comments[index]);
            
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    title: Text(eachComment.body),
                  ),
                );
              },
            ),
          );
        }

        return Center(
          child: Text(snapshot.data?.bodyString ?? "An error"),
        );
      },
    );
  }
}
