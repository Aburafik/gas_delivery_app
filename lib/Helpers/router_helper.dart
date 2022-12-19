import 'package:gas_delivery_app/Views/authentication/sign_up.dart';
import 'package:gas_delivery_app/Views/authentication/verified_phone.dart';
import 'package:gas_delivery_app/Views/dashboard/dash_board_view.dart';
import 'package:gas_delivery_app/Views/onboarding/splash_view.dart';
import 'package:gas_delivery_app/Views/payments/select_payment_method.dart';
import 'package:get/route_manager.dart';

class RouterHelper {
  static const String initialRoute = "/initial";
  static const String onboarding = "/signUp";
  static const String phoneverification = "/phoneverification";
  static const String dashboard = "/dashboard";
  static const String home = "/home";
  static const String orders = "/orders";
  static const String profile = "/profile";
  static const String selectPaymentMethod = "/selectPaymentMethod";

  static List<GetPage> router = [
    GetPage(name: initialRoute, page: () => const SPlashView()),
    GetPage(name: onboarding, page: () => SignUpVC()),
    GetPage(name: onboarding, page: () => SignUpVC()),
    GetPage(name: phoneverification, page: () => const VerifyPhoneVC()),
    GetPage(
        name: dashboard,
        page: () => DashBoardView(
              pageIndex: Get.parameters['page'] == 'home'
                  ? 0
                  : Get.parameters['page'] == 'orders'
                      ? 1
                      : Get.parameters['page'] == 'profile'
                          ? 1
                          : 0,
            ),
        children: [
          GetPage(
              name: selectPaymentMethod, page: () => SelectPaymentMethodVC())
        ]),
  ];
}
