import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import 'helper/colorstyle.dart';
import 'more.dart';

class builder extends StatefulWidget {
  const builder({Key? key}) : super(key: key);

  @override
  State<builder> createState() => _builderState();
}

class _builderState extends State<builder> {
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
        title: FittedBox(child: const Text('Builder')),
        centerTitle: false,
        backgroundColor: Color(CustomColors().Purple),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: _pushMore,
          )
        ],
      ),
      body: const BuilderPageUI(),
    );
  }
}

class BuilderPageUI extends StatefulWidget {
  const BuilderPageUI({Key? key}) : super(key: key);

  @override
  State<BuilderPageUI> createState() => _BuilderPageUIState();
}

class _BuilderPageUIState extends State<BuilderPageUI> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  //String localObjectReference;
  ARNode? localObjectNode;
  ARNode? fileSystemNode;

  //String webObjectReference;
  ARNode? webObjectNode;

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ARView(
          onARViewCreated: onARViewCreated,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox.fromSize(
                  size: Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: Color(CustomColors().Green), // button color
                      child: InkWell(
                        splashColor: Color(CustomColors().Green),
                        // inkwell color
                        onTap: () {
                          onWebObjectAtButtonPressed();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: Color(CustomColors().Grey),
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .25),
                SizedBox.fromSize(
                  size: Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: Color(CustomColors().Red), // button color
                      child: InkWell(
                        splashColor: Color(CustomColors().Red), // inkwell color
                        onTap: () {
                          onWebObjectAtButtonPressed();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.delete_outline,
                              color: Color(CustomColors().Grey),
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        )
      ],
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "assets/triangle.png",
          showWorldOrigin: true,
          handleTaps: false,
        );
    this.arObjectManager.onInitialize();
  }

  Future<void> onLocalFileSystemButtonPressed() async {
    if (fileSystemNode != null) {
      arObjectManager.removeNode(fileSystemNode!);
      fileSystemNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri: "assets/Chair/SheenChair.glb",
          scale: Vector3(0.2, 0.2, 0.2));
      bool? didAddFileSystemNode = await arObjectManager.addNode(newNode);
      fileSystemNode = (didAddFileSystemNode!) ? newNode : null;
    }
  }

  Future<void> onLocalObjectButtonPressed() async {
    if (localObjectNode != null) {
      arObjectManager.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.localGLTF2,
          uri: "assets/Chicken_01/Chicken_01.gltf",
          scale: Vector3(0.2, 0.2, 0.2),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0));
      bool? didAddLocalNode = await arObjectManager.addNode(newNode);
      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }

  Future<void> onWebObjectAtButtonPressed() async {
    if (webObjectNode != null) {
      arObjectManager.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      var newNode = ARNode(
          type: NodeType.webGLB,
          uri:
          "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/SheenChair/glTF-Binary/SheenChair.glb",
          scale: Vector3(0.2, 0.2, 0.2));
      bool? didAddWebNode = await arObjectManager.addNode(newNode);
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }


  }

}
