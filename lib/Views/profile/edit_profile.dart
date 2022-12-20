import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Utils/colors.dart';

class EditProfileVC extends StatelessWidget {
  const EditProfileVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.commonColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  Positioned(
                    top: 100,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColors.whiteColor,
                                    )),
                                Text("Edit Profile",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            color: AppColors.whiteColor)),
                                Container()
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Stack(
                            children: const [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"),
                              ),
                              Positioned(
                                left: 80,
                                top: 80,
                                child: CircleAvatar(
                                  child: Icon(Icons.camera_alt_outlined),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const EditTextField(
                    labelText: "Full Name",
                  ),
                  const EditTextField(
                    labelText: "Phon",
                  ),
                  const EditTextField(
                    labelText: "Email",
                  ),
                  const EditTextField(
                    labelText: "Address",
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CommonButton(
                      title: "Update",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  const EditTextField({Key? key, this.controller, this.labelText})
      : super(key: key);
  final TextEditingController? controller;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
