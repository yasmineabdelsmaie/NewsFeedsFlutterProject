import 'package:intl/intl.dart';

class Article {
  String _author = "";
  String _title = "";
  String _description = "";
  String _url = "";
  String _urlToImage = "";
  String _publishedAt = "";

  Article(
      {String author,
      String title,
      String description,
      String url,
      String urlToImage,
      String publishedAt}) {
    this._author = author;
    this._title = title;
    this._description = description;
    this._url = url;
    this._urlToImage = urlToImage;
    this._publishedAt = publishedAt;
  }

  String get author => _author;
  set author(String author) => _author = author;
  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;
  String get url => _url;
  set url(String url) => _url = url;
  String get urlToImage => _urlToImage;
  set urlToImage(String urlToImage) => _urlToImage = urlToImage;
  String get publishedAt => _publishedAt;
  set publishedAt(String publishedAt) => _publishedAt = publishedAt;

  Article.fromJson(Map<String, dynamic> json) {
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this._author;
    data['title'] = this._title;
    data['description'] = this._description;
    data['url'] = this._url;
    data['urlToImage'] = this._urlToImage;
    data['publishedAt'] = this._publishedAt;
    return data;
  }

  String FormateDate() {
    DateTime articleDate = DateTime.parse(publishedAt);
    return new DateFormat("MMM dd, yyyy").format(articleDate);
  }

  String ArticleAuthor() {
    if (author == null)
      return "Unkown Author";
    else
      return author;
  }
}
