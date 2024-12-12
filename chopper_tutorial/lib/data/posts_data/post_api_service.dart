import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: "/posts")
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response> getPosts();

  @Get(path: "/{id}")
  Future<Response> getPost(@Path("id") int id);

  @Post()
  Future<Response> postPost(@Body() Map<String, dynamic> body);

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse("https://jsonplaceholder.typicode.com"),
      services: [
        _$PostApiService(),
      ],
      converter: const JsonConverter(),
    );

    return _$PostApiService(client);
  }
}
