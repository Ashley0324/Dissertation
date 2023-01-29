import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:collection/collection.dart';


class ARPage extends StatelessWidget {
  const ARPage({
    Key?key,
    required this.image
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: buildAppBar(context),
      body:BodyAR(image:image),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      padding: const EdgeInsets.only(left: 20),
      icon: SvgPicture.asset("images/back.svg"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: false,
    title: Text(
      'Back'.toUpperCase(),
      style: Theme.of(context).textTheme.bodyText2,
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
        onPressed: () {},
      ),
    ],
  );
}

class BodyAR extends StatefulWidget {
  const BodyAR({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  State<BodyAR> createState() => _BodyARState(image: this.image);
}

class _BodyARState extends State<BodyAR> {
  late ARKitController arkitController;
  ARKitNode? boxNode;
  final String image;
  _BodyARState({required this.image});

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_alt),
          onPressed: () async {
            try {
              final image = await arkitController.snapshot();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SnapshotPreview(
                    imageProvider: image,
                  ),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
        ),
        body: Container(
          child: ARKitSceneView(
            showFeaturePoints: true,
            enablePinchRecognizer: true,
            enablePanRecognizer: true,
            enableRotationRecognizer: true,
            onARKitViewCreated: onARKitViewCreated,
          ),
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onNodePinch = (pinch) => _onPinchHandler(pinch);
    this.arkitController.onNodePan = (pan) => _onPanHandler(pan);
    this.arkitController.onNodeRotation =
        (rotation) => _onRotationHandler(rotation);
    addNode();
  }


  void addNode() async{
    final material = ARKitMaterial(
      lightingModelName: ARKitLightingModel.lambert,
      diffuse: ARKitMaterialProperty.image(image),
    );
    final box = ARKitBox(
        materials: [material],
        width: 0.5,
        height: 0.5,
        length:0.01
    );

    final node = ARKitNode(
      geometry: box,
      position: vector.Vector3(0, 0, -0.5),
    );
    arkitController.add(node);
    boxNode = node;
  }

  void _onPinchHandler(List<ARKitNodePinchResult> pinch) {
    final pinchNode = pinch.firstWhereOrNull(
          (e) => e.nodeName == boxNode?.name,
    );
    if (pinchNode != null) {
      final scale = vector.Vector3.all(pinchNode.scale);
      boxNode?.scale = scale;
    }
  }

  void _onPanHandler(List<ARKitNodePanResult> pan) {
    final panNode = pan.firstWhereOrNull((e) => e.nodeName == boxNode?.name);
    if (panNode != null) {
      final old = boxNode?.eulerAngles;
      final newAngleY = panNode.translation.x * math.pi / 180;
      boxNode?.eulerAngles =
          vector.Vector3(old?.x ?? 0, newAngleY, old?.z ?? 0);
    }
  }

  void _onRotationHandler(List<ARKitNodeRotationResult> rotation) {
    final rotationNode = rotation.firstWhereOrNull(
          (e) => e.nodeName == boxNode?.name,
    );
    if (rotationNode != null) {
      final rotation = boxNode?.eulerAngles ??
          vector.Vector3.zero() + vector.Vector3.all(rotationNode.rotation);
      boxNode?.eulerAngles = rotation;
    }
  }
}

class SnapshotPreview extends StatelessWidget {
  const SnapshotPreview({
    Key? key,
    required this.imageProvider,
  }) : super(key: key);

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: imageProvider),
        ],
      ),
    );
  }
}