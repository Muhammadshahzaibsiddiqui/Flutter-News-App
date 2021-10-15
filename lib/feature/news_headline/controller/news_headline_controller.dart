
import 'package:application/core/model/article.dart';
import 'package:application/core/repository/news_repo.dart';
import 'package:application/core/repository/news_repo_impl.dart';
import 'package:get/get.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs; //to load all the headlines when screen will open by default 
                            /// so we need to call method in constructor

  RxList<Article> articles;

  loadNewsLine() async {

     showLoading();

    final result = await _newsRepo.getNewsHeadline();

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