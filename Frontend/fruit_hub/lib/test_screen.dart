import 'package:flutter/material.dart';
import 'package:fruit_hub/widget_helper/filter_items.dart';
import 'package:popover/popover.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(child: Text('HI')),
          PopupMenuItem(child: Text('HI')),
          PopupMenuItem(child: Text('HI')),
          PopupMenuItem(child: Text('HI')),
        ],
      )),
    );
  }
}
