import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsfeedsapp/views/live_chat.dart';
import 'package:newsfeedsapp/views/wishlist.dart';

import 'articles_page.dart';
import 'explore_online_news.dart';
import 'gallery.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawerState();
  }
}

class DrawerState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    String ArticlesMenuItem = "Articles";
    String LiveChatMenuItem = "Live Chat";
    String ExploreOnlineNewsMenuItem = "Explore Online News";
    String GalleryMenuItem = "Gallery";
    String WishListMenuItem = "WishList";
    return Drawer(
      child: Container(
        color: Color.fromRGBO(217, 217, 217, 1),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    child: Image.asset("images/profile.png"),
                    width: 60,
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(129, 129, 129, 1)),
                        ),
                        Text(
                          "Tony Roshdy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ListTile(
              leading: Container(
                  height: 30,
                  child: Image(image: AssetImage("images/article.png"))),
              title: Text(ArticlesMenuItem),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (ArticlesPage(ArticlesMenuItem))),
                );
              },
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (LiveChat(LiveChatMenuItem))),
                );
              },
              leading: Container(
                  height: 30,
                  child: Image(image: AssetImage("images/live.png"))),
              title: Text(LiveChatMenuItem),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (Gallery(GalleryMenuItem))),
                );
              },
              leading: Container(
                  height: 30,
                  child: Image(image: AssetImage("images/gallery.png"))),
              title: Text(GalleryMenuItem),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (WishList(WishListMenuItem))),
                );
              },
              leading: Container(
                  height: 30,
                  child: Image(image: AssetImage("images/wishlist.png"))),
              title: Text(WishListMenuItem),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          (ExploreOnlineNews(ExploreOnlineNewsMenuItem))),
                );
              },
              leading: Container(
                  height: 30,
                  child: Image(image: AssetImage("images/explore.png"))),
              title: Text(ExploreOnlineNewsMenuItem),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
