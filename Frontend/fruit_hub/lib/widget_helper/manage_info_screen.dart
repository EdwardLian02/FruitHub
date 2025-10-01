import 'package:flutter/material.dart';
import 'package:fruit_hub/widget_helper/common_textField.dart';

class ManageInfoScreen extends StatelessWidget {
  const ManageInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Manage Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      AssetImage("assets/images/random_person.png"),
                ),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10),
            CommonTextfield(hintText: "Name"),
            SizedBox(height: 10),
            CommonTextfield(hintText: "Email"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
