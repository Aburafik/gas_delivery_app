import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Components/text_feild_component.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:gas_delivery_app/Utils/images.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class SignUpVC extends StatefulWidget {
  const SignUpVC({super.key});

  @override
  State<SignUpVC> createState() => _SignUpVCState();
}

class _SignUpVCState extends State<SignUpVC> {
  TextEditingController campusController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController hostelController = TextEditingController();

  bool isAstudent = true;

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
                    height: MediaQuery.of(context).size.height / 8,
                    child: Image.asset(
                      Images.main_logo,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Align(
                      child: Text(
                        "Let's Get You Registered",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  CommonTextField(
                    hintText: "Fisrt Name",
                    icon: Icons.person,
                    controller: firstNameController,
                  ),
                  CommonTextField(
                    hintText: "Last Name",
                    icon: Icons.person,
                    controller: lastNameController,
                  ),
                  CommonTextField(
                    hintText: "Phone Number",
                    icon: Icons.phone,
                    controller: phoneNumberController,
                  ),
                  CommonTextField(
                    hintText: "Location/Address",
                    icon: Icons.location_on,
                    controller: locationController,
                  ),
                  Row(
                    children: [
                      Text("Are you a student ?"),
                      Switch.adaptive(
                          value: isAstudent,
                          onChanged: (val) {
                            setState(() {
                              isAstudent = val;
                            });
                          })
                    ],
                  ),
                  // RadioListTile(
                  //   value: true,
                  //   groupValue: false,
                  //   onChanged: (value) {},
                  //   title: Text("Are you a student?"),
                  // ),
                  isAstudent
                      ? Column(
                          children: [
                            CommonTextField(
                              hintText: "Campus",
                              icon: Icons.school_outlined,
                              controller: campusController,
                            ),
                            CommonTextField(
                              hintText: "Hostel",
                              icon: Icons.home,
                              controller: hostelController,
                            ),
                          ],
                        )
                      : Wrap(),
                  const SizedBox(height: 10),
                  CommonButton(
                    title: "Continue",
                    onPressed: () {
                      Get.toNamed(
                        RouterHelper.phoneverification,
                        parameters: {"phoneNumber": phoneNumberController.text},
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
