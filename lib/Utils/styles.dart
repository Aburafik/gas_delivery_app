import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Utils/colors.dart';

TextStyle robotoSmall = TextStyle(fontSize: 20, fontFamily: "Roboto");

boxDecoration({bool? selectedColor=false}) {
  return BoxDecoration(
    color: selectedColor! ? Colors.red : AppColors.greyColor,
    borderRadius: BorderRadius.circular(10),
  );
}
    var outlineInputBorder = OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          );