// @dart=2.9
import 'package:application/core/repository/news_repo_impl.dart';
import 'package:application/feature/news_headline/controller/news_headline_controller.dart';
import 'package:get/get.dart';


class NewsHeadlineBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }

}
