import 'package:flutter/material.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text(
            "News Headline",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Get.toNamed("/news_headline");
          },
          leading: Icon(
            Icons.contact_page_outlined,
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text(
            "Search News ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Get.toNamed("/search_news");
          },
          leading: Icon(
            Icons.search_sharp,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
