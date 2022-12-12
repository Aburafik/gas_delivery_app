import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:gas_delivery_app/Themes/dark_theme.dart';
import 'package:gas_delivery_app/Views/onboarding/splash_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialRoute: RouterHelper.initialRoute,
      getPages: RouterHelper.router,
    );
  }
}
