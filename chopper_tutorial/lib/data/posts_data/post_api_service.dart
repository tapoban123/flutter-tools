import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_tutorial/data/posts_data/built_value_convertor.dart';
import 'package:chopper_tutorial/interceptors/mobile_data_interceptor.dart';
import 'package:chopper_tutorial/models/built_post.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: "/posts")
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: "/{id}")
  Future<Response<BuiltPost>> getPost(@Path("id") int id);

  @Post()
  Future<Response<BuiltPost>> postPost(@Body() BuiltPost body);

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse("https://jsonplaceholder.typicode.com"),
      interceptors: [
        // const HeadersInterceptor({"Cache-Control":"no-cache"}),
        HttpLoggingInterceptor(),
        // CurlInterceptor(),
        
        // (Request request)async{
        //   if (request.method == HttpMethod.Post){
        //     chopperLogger.info("Performed a Post request.");
        //   }

        //   return request;
        // }
        // MobileDataIntercepter(),
      ],
      services: [
        _$PostApiService(),
      ],
      converter: BuiltValueConvertor(),
    );

    return _$PostApiService(client);
  }
}


