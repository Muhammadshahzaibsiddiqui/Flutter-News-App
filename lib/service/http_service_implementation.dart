
import 'package:application/service/http_service.dart';
import 'package:dio/dio.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "eb44ea934f4c4a9fac64ca572f9c12c7";

class HttpServiceImpl implements HttpService {
  Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
   

    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

///Interceptors for dio because it helps you to monitor the request 
///for making sure we have sent the correct data, you are hitting correct url

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error){
        print(error.message);
      },
      onRequest: (request){
        print("${request.method} | ${request.path}"); //path is the endpoint
      },
      onResponse: (response){
        print("${response.statusCode} ${response.statusMessage} ${response.data}");
      }
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL,
        //we will send api key in header
        headers: {"Authorization": "Bearer $API_KEY"}));

         initializeInterceptors();
  }

  

}
