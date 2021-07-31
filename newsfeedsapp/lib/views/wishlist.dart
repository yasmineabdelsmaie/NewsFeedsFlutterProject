import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  String Title;
  WishList(this.Title) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          "Sorry, The service is not available",
          style: TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
