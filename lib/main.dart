import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:planovate/catalog.dart';
import 'package:planovate/helper/colorstyle.dart';
import 'package:planovate/profile.dart';
import 'package:planovate/search.dart';
import 'package:planovate/testviewer.dart';
import 'package:planovate/viewer.dart';

import 'helper/colorstyle.dart';
import 'package:planovate/helper/customicons_icons.dart';
import 'likes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(CustomColors().DarkYellow),
          ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedpage = 0;
  final _pageNo = [catalog(), search(), testbuilder(), likes(), profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(CustomColors().Grey),
        color: Color(0xFF6E6E6E),
        activeColor: Color(CustomColors().DarkYellow),
        style: TabStyle.fixed,
        curveSize: 150,
        top: -20,
        height: 60,


        items: [
          TabItem(icon: Icons.home, title: ' '),
          TabItem(icon: Icons.search,title: ' '),
          TabItem(icon: Customicons.planovate,title: ' '),
          TabItem(icon: Icons.favorite,title: ' '),
          TabItem(icon: Icons.person,title: ' '),
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}
