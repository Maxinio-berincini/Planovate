import 'package:flutter/material.dart';

import 'helper/colorstyle.dart';
import 'helper/textstyle.dart';
import 'more.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
        title: FittedBox(child: const Text('Profile')),
        centerTitle: false,
        backgroundColor: Color(CustomColors().Purple),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: _pushMore,
          )
        ],
      ),
      body: const ProfilePageUI(),
    );
  }
}

class ProfilePageUI extends StatefulWidget {
  const ProfilePageUI({Key? key}) : super(key: key);

  @override
  State<ProfilePageUI> createState() => _ProfilePageUIState();
}

class _ProfilePageUIState extends State<ProfilePageUI> {
  double CategoryTopSpacing = 3;
  double CategoryBottomSpacing = 40;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 10),
        Column(
          children: <Widget>[
            Center(
              child: Text("Planovate", style: Style.TitleFont),
            ),
            SizedBox(height: 20),
            Center(
              child: Image(
                image: AssetImage('assets/img/logofinal.png'),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            SizedBox(height: CategoryBottomSpacing),
            Center(
              child: Text("Max Mustermann", style: Style.ProfileFont),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Text('Einstellungen', style: Style.TitleFont),
          ],
        ),
        const Divider(height: 5, thickness: 1, color: Colors.black),
        SizedBox(height: CategoryTopSpacing),
      ],
    );
  }
}
