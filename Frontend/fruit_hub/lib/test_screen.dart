import 'dart:async';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 400,
            toolbarHeight: 100,
            title: Text("HI"),
          ),
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBox(
                    Colors.black,
                  ),
                  _buildBox(
                    Colors.black,
                  ),
                  _buildBox(
                    Colors.black,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining()
        ],
      ),
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}
