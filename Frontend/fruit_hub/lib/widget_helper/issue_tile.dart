import 'package:flutter/material.dart';
import 'package:fruit_hub/helper/app_constant.dart';

class IssueTile extends StatelessWidget {
  final String value;
  final String group;
  final void Function(String?)? onChanged;
  const IssueTile(
      {super.key, required this.value, required this.group, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 218, 218, 218),
        ),
      ),
      child: RadioListTile(
        title: Text("Poor Photo Quality"),
        value: value,
        groupValue: group,
        onChanged: onChanged,
      ),
    );
  }
}
