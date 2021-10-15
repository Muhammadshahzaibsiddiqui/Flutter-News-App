// @dart=2.9
import 'package:application/core/model/article.dart';
import 'package:json_annotation/json_annotation.dart';


/// flutter pub run build_runner build
/// by typing this command it will automatically
/// generate article.g.dart file
part 'news_response_model.g.dart';

@JsonSerializable(nullable: false)
class NewsResponse {
  NewsResponse();

  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "totalResults")
  int totalResults;

  @JsonKey(name: "articles")
  List<Article> articles;

  ///these are the line we are getting from
  ///Json Serializable and its also called a boiler plate
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
