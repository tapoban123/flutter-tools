import 'package:chopper/chopper.dart';
import 'package:chopper_tutorial/interceptors/mobile_data_interceptor.dart';

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
      interceptors: [
        const HeadersInterceptor({"Cache-Control":"no-cache"}),
        // HttpLoggingInterceptor(),
        CurlInterceptor(),
        
        // (Request request)async{
        //   if (request.method == HttpMethod.Post){
        //     chopperLogger.info("Performed a Post request.");
        //   }

        //   return request;
        // }
        MobileDataIntercepter(),
      ],
      services: [
        _$PostApiService(),
      ],
      converter: const JsonConverter(),
    );

    return _$PostApiService(client);
  }
}


