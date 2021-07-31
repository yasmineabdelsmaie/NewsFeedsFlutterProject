import 'package:newsfeedsapp/models/article.dart';

class ResponseModel {
  String status = "";
  String source = "";
  String sortBy = "";
  List<Article> articles = [];
  ResponseModel({this.status, this.articles, this.sortBy, this.source});
  ResponseModel.fromJson(Map<String, dynamic> json) {
    json['articles'].forEach((v) {
      articles.add(new Article.fromJson(v));
    });

    status:
    json['status'];
    source:
    json['source'];
    sortBy:
    json['sortBy'];
    articles:
    json['articles'];
  }
}
