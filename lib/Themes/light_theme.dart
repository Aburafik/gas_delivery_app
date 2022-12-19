import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Utils/colors.dart';

final lightTheme = ThemeData(
  fontFamily: "Roboto",
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.commonColor,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: AppColors.blackColor,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.commonColor,
      foregroundColor: AppColors.whiteColor,
    ),
  ),
);
