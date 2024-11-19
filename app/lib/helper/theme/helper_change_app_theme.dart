
import 'package:app/helper/theme/responsbal_screen_size_helper.dart';
import 'package:app/helper/theme/tap_theme/app_taplate_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_phone_theme.dart';
import 'disk_top_theme/app_disk_top_theme.dart';
import 'get_user_selected_theme_storge.dart';

class ThemeService {
  ThemeService._();
  static ThemeData lightTheme = ThemeData(fontFamily: AppFonts.cairo,);
  static ThemeData darkTheme = ThemeData(fontFamily: AppFonts.cairo);
  static getTheme() async {

      // lightTheme = CustomLightPhoneTheme.lightTheme;
      // darkTheme = CustomDarkPhoneTheme.darkTheme;


      if (ResponsiveSize.isSmallScreen()) {
        lightTheme = CustomLightPhoneTheme.lightTheme;
        darkTheme = CustomDarkPhoneTheme.darkTheme;
      } else if (ResponsiveSize.isMediumScreen()) {
        lightTheme = CustomLightTapTheme.lightTheme;
        darkTheme = CustomDarkTapTheme.darkTheme;
      } else if (ResponsiveSize.isLargeScreen()) {
        lightTheme = CustomLightDiskTopTheme.lightTheme;
        darkTheme = CustomDarkDiskTopTheme.darkTheme;
      }
    if (!await UserSelectedThemeStorage().getLocal()) {
      Get.changeTheme(lightTheme);
    } else {
      Get.changeTheme(darkTheme);
    }
  }

  static switchTheme() async {
   // print(await UserSelectedThemeStorage().getLocal());
    if (await UserSelectedThemeStorage().getLocal()) {
      await UserSelectedThemeStorage().saveLocal(data: false);
      Get.changeTheme(lightTheme);

    } else {
      await UserSelectedThemeStorage().saveLocal(data: true);
      Get.changeTheme(darkTheme);
    }
  }
}
