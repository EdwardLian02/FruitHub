import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/profile_controller.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
        onDoubleTap: () {},
        highlightColor: Colors.green.withOpacity(0.5),
        onLongPress: () {},
        child: Ink(
          width: 400,
          height: 400,
          color: Colors.black,
        ),
      ),
    ));
  }
}
