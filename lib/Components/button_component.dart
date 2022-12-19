import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  CommonButton({Key? key, this.onPressed, this.title}) : super(key: key);
  String? title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(title!),
      ),
    );
  }
}
