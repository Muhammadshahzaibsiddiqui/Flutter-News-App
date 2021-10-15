import 'package:application/core/model/article.dart';
import 'package:application/core/model/news_response_model.dart';
import 'package:application/core/repository/news_repo.dart';

import 'package:application/service/http_service.dart';
import 'package:application/service/http_service_implementation.dart';
import 'package:get/get.dart';

class NewsRepoImpl implements NewsRepo {
 HttpService _httpService;

    NewsRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async{
   try {
       final response = await _httpService.getRequest("/v2/top-headlines?country=us");

       final parsedResponse = NewsResponse.fromJson(response.data);

       return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async{
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}