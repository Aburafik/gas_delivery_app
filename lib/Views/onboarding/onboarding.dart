import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Utils/images.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset(Images.logo)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Enter your mobile number",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                TextField(
                    cursorColor: Colors.grey,
                    textAlign: TextAlign.center,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
