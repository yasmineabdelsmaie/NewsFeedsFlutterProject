import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newsfeedsapp/models/article.dart';
import 'package:newsfeedsapp/models/response_model.dart';
import 'package:newsfeedsapp/views/article_details.dart';
import 'package:newsfeedsapp/views/side_menu.dart';
import 'package:http/http.dart' as http;

class ArticlesPage extends StatelessWidget {
  String Title;
  ArticlesPage(this.Title) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      drawer: Drawer(
        child: SideMenu(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(Title),
      ),
      body: FutureBuilder<List<Article>>(
        future: getArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> data = snapshot.data;
            return _articlesListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

ListView _articlesListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _articlesContainer(data[index], context);
      });
}

Widget _articlesContainer(data, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => (ArticleDetails(data)),
          ));
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 410,
      child: Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(data.urlToImage),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: Text(data.title,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 10, 10),
                child: Text(
                  "By " + data.ArticleAuthor(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(153, 153, 153, 1)),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      data.FormateDate(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(153, 153, 153, 1)),
                    )),
              ),
            ]),
      ),
    ),
  );
}

String GetAPIRUL(String Source, String ApiKey) {
  print(
      "https://newsapi.org/v1/articles?source=" + Source + "&apiKey=" + ApiKey);
  return "https://newsapi.org/v1/articles?source=" +
      Source +
      "&apiKey=" +
      ApiKey;
}

Future<List<Article>> getArticles() async {
  List<Article> AllArticles = [];
  String apiKey = "28a7c52891c64ddea94950ba21ae2e3e";
  List<String> ArticlesSource = ["the-next-web", "associated-press"];

  for (var source in ArticlesSource) {
    final response = await http.get(Uri.parse(GetAPIRUL(source, apiKey)));
    if (response.statusCode == 200) {
      ResponseModel articlesObj =
          ResponseModel.fromJson(jsonDecode(response.body));
      AllArticles.addAll(articlesObj.articles);
    } else {
      throw Exception('Failed to load');
    }
  }
  return AllArticles;
}
