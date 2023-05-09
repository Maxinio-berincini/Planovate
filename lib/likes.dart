import 'package:flutter/material.dart';
import 'helper/colorstyle.dart';
import 'more.dart';


class likes extends StatefulWidget {
  const likes({Key? key}) : super(key: key);

  @override
  State<likes> createState() => _likesState();
}

class _likesState extends State<likes> {
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
        FittedBox(child: const Text('Favoriten')),
        centerTitle: false,
        backgroundColor: Color(CustomColors().Purple),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: _pushMore,
          )
        ],
      ),
      body: const LikesPageUI(),
    );
  }
}

class LikesPageUI extends StatefulWidget {
  const LikesPageUI({Key? key}) : super(key: key);

  @override
  State<LikesPageUI> createState() => _LikesPageUIState();
}

class _LikesPageUIState extends State<LikesPageUI> {


  @override
  Widget build(BuildContext context) {
    return Text("Favoriten");
  }
}

