import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Components/text_feild_component.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:gas_delivery_app/Utils/images.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class SignUpVC extends StatelessWidget {
  SignUpVC({super.key});
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController nameCOntroller = TextEditingController();
  TextEditingController phoneNumberCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.asset(Images.main_logo,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Align(
                      child: Text(
                        "Enter your mobile number",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  CommonTextField(
                    hintText: "Name",
                    icon: Icons.person,
                    controller: nameCOntroller,
                  ),
                  CommonTextField(
                    hintText: "Email",
                    icon: Icons.email,
                    controller: emailCOntroller,
                  ),
                  CommonTextField(
                    hintText: "Phone Number",
                    icon: Icons.phone,
                    controller: phoneNumberCOntroller,
                  ),
                  const SizedBox(height: 10),
                  CommonButton(
                    title: "Continue",
                    onPressed: () {
                      Get.toNamed(
                        RouterHelper.phoneverification,
                        parameters: {"phoneNumber": phoneNumberCOntroller.text},
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
