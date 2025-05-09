import 'package:chopper/chopper.dart';

part 'comments_api_service.chopper.dart';

@ChopperApi(baseUrl: "/comments")
abstract class CommentsApiService extends ChopperService {
  @Get()
  Future<Response> getAllComments();

  @Get()
  Future<Response> getSingleComment({@Query("postId") required int postId});

  static CommentsApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse("https://jsonplaceholder.typicode.com"),
      services: [
        _$CommentsApiService(),
      ],
      converter: const JsonConverter(),
    );
    return _$CommentsApiService(client);
  }
}
