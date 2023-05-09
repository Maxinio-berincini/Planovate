import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'helper/colorstyle.dart';
import 'more.dart';

class testbuilder extends StatefulWidget {
  const testbuilder({Key? key}) : super(key: key);

  @override
  State<testbuilder> createState() => _testbuilderState();
}

class _testbuilderState extends State<testbuilder> {
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
      body: const TestBuilderPageUI(),
    );
  }
}

class TestBuilderPageUI extends StatefulWidget {
  const TestBuilderPageUI({Key? key}) : super(key: key);

  @override
  State<TestBuilderPageUI> createState() => _TestBuilderPageUIState();
}

class _TestBuilderPageUIState extends State<TestBuilderPageUI> {


  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  ARAnchorManager? arAnchorManager;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];

  String uri = "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/SheenChair/glTF-Binary/SheenChair.glb";
  String title = "Chair";

  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
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
                            if (title ==
                                "Sofa") {
                              uri =
                              "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/SheenChair/glTF-Binary/SheenChair.glb";
                              title = "Chair";
                              print ("uri changed to chair");
                            } else {
                              uri =
                              "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/GlamVelvetSofa/glTF-Binary/GlamVelvetSofa.glb";
                              title = "Sofa";
                              print ("uri changed to seat");
                            }
                            final snackBar = SnackBar(
                              content: Text('Switched to $title'),
                              duration: const Duration(seconds: 1),

                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width * .25),
                  SizedBox.fromSize(
                    size: Size(56, 56),
                    child: ClipOval(
                      child: Material(
                        color: Color(CustomColors().Red), // button color
                        child: InkWell(
                          splashColor: Color(CustomColors().Red),
                          // inkwell color
                          onTap: () {
                            onRemoveEverything();
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
        ]);
  }

  void onARViewCreated(ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager!.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "Images/triangle.png",
      showWorldOrigin: true,
      handlePans: true,
      handleRotation: true,
    );
    this.arObjectManager!.onInitialize();

    this.arSessionManager!.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager!.onPanStart = onPanStarted;
    this.arObjectManager!.onPanChange = onPanChanged;
    this.arObjectManager!.onPanEnd = onPanEnded;
    this.arObjectManager!.onRotationStart = onRotationStarted;
    this.arObjectManager!.onRotationChange = onRotationChanged;
    this.arObjectManager!.onRotationEnd = onRotationEnded;
  }

  Future<void> onRemoveEverything() async {
    /*nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });*/
    anchors.forEach((anchor) {
      this.arAnchorManager!.removeAnchor(anchor);
    });
    anchors = [];
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    var singleHitTestResult = hitTestResults.firstWhere(
            (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor =
      ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      bool? didAddAnchor = await this.arAnchorManager!.addAnchor(newAnchor);
      if (didAddAnchor!) {
        this.anchors.add(newAnchor);
        // Add note to anchor
        var newNode = ARNode(
            type: NodeType.webGLB,
            uri: uri,
            //"https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/SheenChair/glTF-Binary/SheenChair.glb",
            //https://github.com/IKEA/IKEA3DAssemblyDataset/raw/main/Dataset/BEKV%C3%84M_40463852/glTF_glb/BEKV%C3%84M_40463852.glb
            scale: Vector3(1, 1, 1),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0));
        bool? didAddNodeToAnchor =
        await this.arObjectManager!.addNode(newNode, planeAnchor: newAnchor);
        if (didAddNodeToAnchor!) {
          this.nodes.add(newNode);
        } else {
          this.arSessionManager!.onError("Adding Node to Anchor failed");
        }
      } else {
        this.arSessionManager!.onError("Adding Anchor failed");
      }
    }
  }

  onPanStarted(String nodeName) {
    print("Started panning node " + nodeName);
  }

  onPanChanged(String nodeName) {
    print("Continued panning node " + nodeName);
  }

  onPanEnded(String nodeName, Matrix4 newTransform) {
    print("Ended panning node " + nodeName);
    final pannedNode =
    this.nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //pannedNode.transform = newTransform;
  }

  onRotationStarted(String nodeName) {
    print("Started rotating node " + nodeName);
  }

  onRotationChanged(String nodeName) {
    print("Continued rotating node " + nodeName);
  }

  onRotationEnded(String nodeName, Matrix4 newTransform) {
    print("Ended rotating node " + nodeName);
    final rotatedNode =
    this.nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //rotatedNode.transform = newTransform;
  }
}


