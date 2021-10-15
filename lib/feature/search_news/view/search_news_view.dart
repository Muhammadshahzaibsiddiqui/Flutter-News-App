// @dart=2.9
import 'package:application/feature/search_news/controller/search_news_controller.dart';
import 'package:application/core/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Search News ",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            backgroundColor: Colors.amber),
        drawer: getAppDrawer(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            controller: controller.searchTextController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Obx(() {
              return controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.articles.isEmpty
                      ? Center(
                          child: Text("No news found"),
                        )
                      : Container(
                          margin: const EdgeInsets.all(10),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller.articles[index].imageUrl == null
                                      ? Container()
                                      : Image.network(
                                          controller.articles[index].imageUrl),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.articles[index].title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    controller.articles[index].desc ?? "",
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: controller.articles.length,
                          ),
                        );
            }),
          )
        ]));
  }
}
