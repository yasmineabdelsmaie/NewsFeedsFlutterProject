import 'package:flutter/material.dart';
import 'package:newsfeedsapp/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  Article selectedArticle;
  ArticleDetails(this.selectedArticle) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Article Details"),
      ),
      body: articleContainer(selectedArticle),
    );
  }

  Widget articleContainer(data) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          height: 650,
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
                      "By " + data.author,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(153, 153, 153, 1)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 10, 10),
                    child: Text(
                      "By " + data.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(153, 153, 153, 1)),
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
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith<Size>(
                (Set<MaterialState> states) {
                  return Size(370, 50);
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.black;
                },
              ),
            ),
            onPressed: _launchURL,
            child: Container(
              child: Text(
                "OPEN WEBSITE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    wordSpacing: 1,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        )
      ],
    );
  }

  _launchURL() async {
    String url = selectedArticle.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
