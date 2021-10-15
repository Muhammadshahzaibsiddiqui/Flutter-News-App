// @dart=2.9
import 'package:dio/dio.dart';

abstract class HttpService{
  void init();


//for get request
//get the url which we want to hit the specified url
  Future<Response> getRequest(String url);

}