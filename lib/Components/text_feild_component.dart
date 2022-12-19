import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Utils/styles.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    Key? key,
    this.controller,
    this.icon,
    this.hintText,
    this.maxLines
  }) : super(key: key);
  IconData? icon;
  TextEditingController? controller;
  String? hintText;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        maxLines:maxLines,
        controller: controller,
        cursorColor: Colors.grey,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            suffixIcon: Icon(icon),
            hintText: hintText,
            contentPadding: const EdgeInsets.all(5),
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder),
      ),
    );
  }
}
