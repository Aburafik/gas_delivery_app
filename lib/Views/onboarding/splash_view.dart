import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Helpers/router_helper.dart';
import 'package:gas_delivery_app/Utils/images.dart';
import 'package:get/route_manager.dart';

class SPlashView extends StatefulWidget {
  const SPlashView({super.key});

  @override
  State<SPlashView> createState() => _SPlashViewState();
}

class _SPlashViewState extends State<SPlashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4), () => Get.toNamed(RouterHelper.onboarding));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(Images.splash_logo),
    );
  }
}
