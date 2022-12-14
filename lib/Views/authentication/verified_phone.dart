import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Utils/images.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneVC extends StatefulWidget {
  final String? phoneNumber;

  const VerifyPhoneVC({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _VerifyPhoneVCState createState() => _VerifyPhoneVCState();
}

class _VerifyPhoneVCState extends State<VerifyPhoneVC> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 100),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(Images.main_logo,height: 50,),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Phone Number Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                      TextSpan(
                          text: Get.parameters['phoneNumber'] ?? "00",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 15)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',

                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      inactiveColor: Colors.grey,
                      activeColor: Colors.grey,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),

                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,

                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code? ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () => snackBar("OTP resend!!"),
                  child: const Text(
                    "RESEND",
                    style:
                        TextStyle(color: AppColors.commonColor, fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            CommonButton(
              onPressed: () {
                formKey.currentState!.validate();
                // conditions for validating
                if (currentText.length != 6 || currentText != "123456") {
                  errorController!.add(ErrorAnimationType
                      .shake); // Triggering error shake animation
                  setState(() => hasError = true);
                } else {
                  setState(
                    () {
                      hasError = false;
                    },
                  );
                  Get.toNamed(RouterHelper.dashboard);
                }
              },
              title: "VERIFY".toUpperCase(),
            ),
          ],
        ),
      ),
    );
  }
}
