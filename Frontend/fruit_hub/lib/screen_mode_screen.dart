import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class ScreenModeScreen extends StatelessWidget {
  const ScreenModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Screen Mode"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Light Mode",
                style: TextStyle(
                  fontSize: FontTheme.textSizeLarge,
                )),
            SizedBox(
              width: 70,
              child: FittedBox(
                child: Switch(
                  activeColor: Colors.amber,
                  activeThumbImage:
                      AssetImage("assets/images/icon/lightmode_icon.png"),
                  inactiveThumbImage:
                      AssetImage("assets/images/icon/darkmode_icon.png"),
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
