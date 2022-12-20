import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:get/route_manager.dart';

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      onPressedOnLastPage: () => Get.toNamed(RouterHelper.signUp),
      pages: [
        const CupertinoOnboardingPage(
          titleFlex: 0,
          title: Text('About this App',),
          body: Icon(
            CupertinoIcons.square_stack_3d_down_right,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Support For Multiple Pages'),
          body: Icon(
            CupertinoIcons.square_stack_3d_down_right,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Great Look in Light and Dark Mode'),
          body: Icon(
            CupertinoIcons.sun_max,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Beautiful and Consistent Appearance'),
          body: Icon(
            CupertinoIcons.check_mark_circled,
            size: 200,
          ),
        ),
      ],
    );
  }
}
