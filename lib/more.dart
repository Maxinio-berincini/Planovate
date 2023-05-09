import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'helper/colorstyle.dart';
import 'helper/textstyle.dart';



class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  double CategoryTopSpacing = 20;
  double CategoryBottomSpacing = 40;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(child: const Text('Über')),
          centerTitle: false,
          backgroundColor: Color(CustomColors().Purple),
          leading: IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Über',
                    style: Style.TitleFont),
              ],
            ),
            const Divider(height: 5, thickness: 1, color: Colors.black),
            SizedBox(height: CategoryTopSpacing),
            Text(
              "Diese App ist im Rahmen einer Projektarbeit an der Universität St. Gallen entstanden. \nGeschrieben wurde sie von Max Beringer, für den Kurs Marktorientierte Unternehmensführung, im Bachelor of Computer Science.",
              style: Style.FlowingTextFont,
            ),
            SizedBox(height: CategoryBottomSpacing),
            const SizedBox(height: 10),

          ],
        ),

    );
  }
}

