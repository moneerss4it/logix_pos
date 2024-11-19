import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/auth/login_screen.dart';
import 'package:app/view/screen/auth/member_screen.dart';
import 'package:app/view/screen/introscreen/onboard.dart';
import 'package:app/view/screen/pos/pos_screen.dart';
import 'package:flutter/foundation.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:app/view/screen/home_screen/home_screen.dart';

import 'helper/theme/color.dart';
import 'helper/theme/helper_change_app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  late bool _isLogin;
  late bool _isGetMember;
  late bool _isIntro;
  late bool _isGetPoint;

  @override
  void initState() {
    super.initState();
    ThemeService.getTheme();
    _isLogin = Get.find<AuthController>().isLoggedIn();
    _isIntro = Get.find<AuthController>().isIntro();
    _isGetPoint = Get.find<ItemController>().isGetDataSalesPoints();

    _isGetMember = Get.find<AuthController>().isGetMember();
    super.initState();


     Timer(
        const Duration(seconds: 2), () {

      _isIntro?(     _isGetMember?     (_isLogin? _isGetPoint?Get.to(const HomeScreen()) :Get.to( const PosScreen()):Get.to(const LoginScreen())): Get.to(MemberScreen())): Get.to(OnboardScreen());
    });
    if (kDebugMode) {
      print("on start app from timer");
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
             backgroundColor:   context.theme.primaryColor,
      body:   Container(
        padding: EdgeInsets.zero,
        child: FadeInDownBig(
          child: Center(child: Image.asset(ImageHelper.splash,)),
        ),
  ),
    );
  }
}




