import 'package:gas_delivery_app/Views/onboarding/onboarding.dart';
import 'package:gas_delivery_app/Views/onboarding/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouterHelper {
  static const String initialRoute = "/initial";
  static const String onboarding = "/onboarding";

  static List<GetPage> router = [
    GetPage(name: initialRoute, page: () => const SPlashView()),
    GetPage(name: onboarding, page: () => const OnboardingView()),
  ];
}
