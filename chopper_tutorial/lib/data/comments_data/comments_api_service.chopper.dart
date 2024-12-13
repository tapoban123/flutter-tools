// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CommentsApiService extends CommentsApiService {
  _$CommentsApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CommentsApiService;

  @override
  Future<Response<dynamic>> getAllComments() {
    final Uri $url = Uri.parse('/comments');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSingleComment(int postId) {
    final Uri $url = Uri.parse('/comments/?postId=${postId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
