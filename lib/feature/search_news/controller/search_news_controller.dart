// @dart=2.9
import 'package:application/core/model/article.dart';
import 'package:application/core/repository/news_repo.dart';
import 'package:application/core/repository/news_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchNewsController extends GetxController{


  NewsRepo _newsRepo;


  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();
  

   searchTextController.addListener(() { 
      if(searchTextController.text.length%3==0 && searchTextController.text.length!=0){
        searchNewsHeadline();
      }
    });
  }
  

 

final searchTextController = TextEditingController();

  RxBool isLoading = false.obs; //to load all the headlines when screen will open by default 
                            /// so we need to call method in constructor

  RxList<Article> articles = RxList();

  searchNewsHeadline() async {

     showLoading();

         final result = await _newsRepo.getSearchedNews(searchTextController.text);

     hideLoading();

    if (result != null) {
      articles = result.obs;

      ///we asign results into articles and articles that Rx is the observabale
      ///to convert normal list into observable we use obs

    } else {
      print("No data recieved");
    }
  }

  showLoading(){
    isLoading.toggle();
  }
  hideLoading(){
    isLoading.toggle();
  }
}


  