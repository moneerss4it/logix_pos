import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyleTheme {
  AppTextStyleTheme._();
  static TextStyle small = Get.textTheme.displayLarge!.copyWith(color: Get.theme.dividerColor);
  static TextStyle get titleScreenText => Get.textTheme.titleMedium!;
  static TextStyle get titlePartText => Get.textTheme.bodyLarge!;
  static TextStyle get inputText =>
      Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal);
  static TextStyle get largeTextView => Get.textTheme.titleLarge!;
  static TextStyle get madelTextView => Get.textTheme.headlineSmall!;
  static TextStyle get smallTextView => Get.textTheme.headlineMedium!.copyWith(color: Get.theme.dividerColor);
  static TextStyle get tapBar => Get.textTheme.displayMedium!;
  static TextStyle get categoryName =>
      Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get productName =>
      Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get productPrise => Get.textTheme.bodyLarge!;
  static TextStyle get productDescription => Get.textTheme.headlineSmall!;
  static TextStyle get textActionBtn => Get.textTheme.titleLarge!
      .copyWith(color: Get.theme.indicatorColor, fontWeight: FontWeight.bold);
  static TextStyle get textIconBtn => Get.textTheme.titleLarge!
      .copyWith(color: Get.theme.indicatorColor, fontWeight: FontWeight.bold);
  static TextStyle get textButton => Get.textTheme.headlineSmall!
      .copyWith(fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle get superSmallTxtBld =>
      Get.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold,color: Get.theme.hoverColor.withOpacity(.5));
  static TextStyle get superSmallTxtNor => Get.textTheme.displayMedium!;
  static TextStyle get smallTxtBld =>
      Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold,color: Get.theme.hoverColor);
  static TextStyle get smallTxtNor => Get.textTheme.displaySmall!.copyWith(color: Get.theme.hoverColor.withOpacity(.5));

  static TextStyle get madelTxtBld =>
      Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,color: Get.theme.hoverColor.withOpacity(.7));
  static TextStyle get madelTxtNor => Get.textTheme.headlineMedium!;
  static TextStyle get largeTxtBld =>
      Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get largeTxtNor => Get.textTheme.headlineSmall!;
  static TextStyle get supLargeTxtBld =>
      Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get LargeTxtBld =>
      Get.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get appParTxtBld =>
      Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get supLargeTxtNor =>
      Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal);
}