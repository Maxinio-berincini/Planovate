import 'package:flutter/material.dart';

import 'helper/colorstyle.dart';
import 'more.dart';


class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  void _pushMore() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const Scaffold(
        body: More(),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        FittedBox(child: const Text('Suchen')),
        centerTitle: false,
        backgroundColor: Color(CustomColors().Purple),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: _pushMore,
          )
        ],
      ),
      body: const SearchPageUI(),
    );
  }
}

class SearchPageUI extends StatefulWidget {
  const SearchPageUI({Key? key}) : super(key: key);

  @override
  State<SearchPageUI> createState() => _SearchPageUIState();
}

class _SearchPageUIState extends State<SearchPageUI> {


  @override
  Widget build(BuildContext context) {
    return Text("Search");
    }
}

