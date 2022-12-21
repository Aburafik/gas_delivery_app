import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Utils/images.dart';
import 'package:get/route_manager.dart';

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      bottomButtonColor: AppColors.commonColor,
      onPressedOnLastPage: () => Get.toNamed(RouterHelper.signUp),
      pages: [
        CupertinoOnboardingPage(
            titleFlex: 0,
            title: Text(
              '',
            ),
            body: Image.asset(Images.about_app)),
        CupertinoOnboardingPage(
            title: Text(''),
            body: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  Images.request_logo,
                  // height: 100,
                )),
                Text(
                  "Make a gas delivery request with a complete and easy steps",
                  textAlign: TextAlign.center,
                )
              ],
            )),
        CupertinoOnboardingPage(
            title: Text(''),
            body: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  Images.paymentlogo,
                )),
                Text(
                  "Select a payment method at your convinience",
                  textAlign: TextAlign.center,
                )
              ],
            )),
        CupertinoOnboardingPage(
            title: Text(''),
            body: Image.asset(
              Images.logo_1,
            )),
      ],
    );
  }
}
