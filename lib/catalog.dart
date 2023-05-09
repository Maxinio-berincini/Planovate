import 'package:flutter/material.dart';

import 'helper/colorstyle.dart';
import 'helper/textstyle.dart';
import 'more.dart';

class catalog extends StatefulWidget {
  const catalog({Key? key}) : super(key: key);

  @override
  State<catalog> createState() => _catalogState();
}

class _catalogState extends State<catalog> {
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
        title: FittedBox(child: const Text('Home')),
        centerTitle: false,
        backgroundColor: Color(CustomColors().Purple),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: _pushMore,
          )
        ],
      ),
      body: const CatalogPageUI(),
    );
  }
}

class CatalogPageUI extends StatefulWidget {
  const CatalogPageUI({Key? key}) : super(key: key);

  @override
  State<CatalogPageUI> createState() => _CatalogPageUIState();
}

class _CatalogPageUIState extends State<CatalogPageUI> {
  IconData sheerchairLike = Icons.favorite_border;
  IconData sofaLike = Icons.favorite_border;
  IconData counterLike = Icons.favorite_border;
  IconData ovenLike = Icons.favorite_border;
  IconData chairLike = Icons.favorite_border;
  IconData sinkLike = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 0,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('Entwurf hochladen',
                      style: Style.TitleFont.merge(
                        TextStyle(
                          color: Color(CustomColors().Black),
                        ),
                      )),
                ],
              ),
              const Divider(height: 5, thickness: 1, color: Colors.black),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 0,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 170,
              //padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(color: Colors.black, width: 2),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),

              // displays the topic image and title
              child: const Image(
                image: AssetImage('assets/img/builder.png'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 0,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('Meine Möbel',
                      style: Style.TitleFont.merge(
                        TextStyle(
                          color: Color(CustomColors().Black),
                        ),
                      )),
                ],
              ),
              const Divider(height: 5, thickness: 1, color: Colors.black),
            ],
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              // Listens for a tap on the button and sends the user to the topic
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (sheerchairLike == Icons.favorite_border)
                        sheerchairLike = Icons.favorite;
                      else
                        sheerchairLike = Icons.favorite_border;

                    });

                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),

                        // displays the topic image and title
                        child: const Image(
                          image: AssetImage('assets/img/sheerchair.png'),
                        ),
                      ),
                      Positioned(
                          child: ClipOval(
                            child: Material(
                              color: Color(CustomColors().LightYellow).withOpacity(0.5), // Button color
                              child: InkWell(
                                child: SizedBox(width: 56, height: 56, child: Icon(sheerchairLike, color: Color(CustomColors().Purple), size: 30,)),
                              ),
                            ),
                          )    ,
                          bottom: 10,
                          right: 10)
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (sofaLike == Icons.favorite_border)
                        sofaLike = Icons.favorite;
                      else
                        sofaLike = Icons.favorite_border;

                    });

                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),

                        // displays the topic image and title
                        child: const Image(
                          image: AssetImage('assets/img/sofa.png'),
                          height: 500,
                          width: 500,
                        ),
                      ),
                      Positioned(
                          child: ClipOval(
                            child: Material(
                              color: Color(CustomColors().LightYellow).withOpacity(0.5), // Button color
                              child: InkWell(
                                child: SizedBox(width: 56, height: 56, child: Icon(sofaLike, color: Color(CustomColors().Purple), size: 30,)),
                              ),
                            ),
                          )    ,
                          bottom: 10,
                          right: 10)
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (ovenLike == Icons.favorite_border)
                        ovenLike = Icons.favorite;
                      else
                        ovenLike = Icons.favorite_border;

                    });

                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),

                        // displays the topic image and title
                        child: const Image(
                          image: AssetImage('assets/img/oven.png'),
                        ),
                      ),
                      Positioned(
                          child: ClipOval(
                            child: Material(
                              color: Color(CustomColors().LightYellow).withOpacity(0.5), // Button color
                              child: InkWell(
                                child: SizedBox(width: 56, height: 56, child: Icon(ovenLike, color: Color(CustomColors().Purple), size: 30,)),
                              ),
                            ),
                          )    ,
                          bottom: 10,
                          right: 10)
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (chairLike == Icons.favorite_border)
                        chairLike = Icons.favorite;
                      else
                        chairLike = Icons.favorite_border;

                    });

                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),

                        // displays the topic image and title
                        child: const Image(
                          image: AssetImage('assets/img/chair.png'),
                        ),
                      ),
                      Positioned(
                          child: ClipOval(
                            child: Material(
                              color: Color(CustomColors().LightYellow).withOpacity(0.5), // Button color
                              child: InkWell(
                                child: SizedBox(width: 56, height: 56, child: Icon(chairLike, color: Color(CustomColors().Purple), size: 30,)),
                              ),
                            ),
                          )    ,
                          bottom: 10,
                          right: 10)
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (sinkLike == Icons.favorite_border)
                        sinkLike = Icons.favorite;
                      else
                        sinkLike = Icons.favorite_border;

                    });

                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),

                        // displays the topic image and title
                        child: const Image(
                          image: AssetImage('assets/img/sink.png'),
                        ),
                      ),
                      Positioned(
                          child: ClipOval(
                            child: Material(
                              color: Color(CustomColors().LightYellow).withOpacity(0.5), // Button color
                              child: InkWell(
                                child: SizedBox(width: 56, height: 56, child: Icon(sinkLike, color: Color(CustomColors().Purple), size: 30,)),
                              ),
                            ),
                          )    ,
                          bottom: 10,
                          right: 10)
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (counterLike == Icons.favorite_border)
                        counterLike = Icons.favorite;
                      else
                        counterLike = Icons.favorite_border;

                    });

                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),

                        // displays the topic image and title
                        child: const Image(
                          image: AssetImage('assets/img/counter.png'),
                        ),
                      ),
                      Positioned(
                          child: ClipOval(
                            child: Material(
                              color: Color(CustomColors().LightYellow).withOpacity(0.5), // Button color
                              child: InkWell(
                                child: SizedBox(width: 56, height: 56, child: Icon(counterLike, color: Color(CustomColors().Purple), size: 30,)),
                              ),
                            ),
                          )    ,
                          bottom: 10,
                          right: 10)
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
