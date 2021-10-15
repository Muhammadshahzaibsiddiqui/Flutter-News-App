// @dart=2.9
import 'package:json_annotation/json_annotation.dart';

/// flutter pub run build_runner build
/// by typing this command it will automatically
/// generate article.g.dart file
part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  Article();

  @JsonKey(name: "author")
  String author;

  @JsonKey(name: "description")
  String desc;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "urlToImage")
  String imageUrl;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "content")
  String content;

  @JsonKey(name: "publishedAt")
  String publishedAt;

  DateTime get getPublishedAtDate => DateTime.tryParse(publishedAt);

  ///these are the line we are getting from
  ///Json Serializable and its also called a boiler plate
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
