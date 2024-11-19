import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:app/helper/route_helper.dart';
import 'package:app/splash_screen.dart';

import 'controller/setting_controller.dart';
import 'di_container.dart' as di;
import 'helper/core/language/translations.dart';

import 'helper/theme/get_user_selected_theme_storge.dart';
import 'helper/theme/helper_change_app_theme.dart';
import 'helper/utill/app_constants.dart';

void main() async{

  await SettingController().initHive();
  await GetStorage.init();
  await UserSelectedThemeStorage().getValueMode();

  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(DevicePreview(
      enabled: false,
      builder: (context) =>const MyApp()));
// loginPost();
//runApp( DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState( );
}
class _MyAppState extends State<MyApp>{
  GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child)=> GetMaterialApp(
          //  initialBinding: CheckInternetBinding(),
          navigatorKey: mainNavigatorKey,
          debugShowCheckedModeBanner: false,
          translations: Translation(),
         // locale: Locale('ar'),
         locale: Locale(GetStorage().read(AppConstants.changeLang)??'ar'),
         // fallbackLocale:  Locale('ar'),
          fallbackLocale: Get.deviceLocale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const[
             Locale('en', 'US'),  // English, no country code
             Locale('ur', 'PK'), // English, no country code
             Locale('ar', ''), // Arabic, no country code
          ],
          title: "Logix POS",
          theme: ThemeService.lightTheme,
          darkTheme: ThemeService.darkTheme,
          themeMode: ThemeMode.light,
          onInit: ()  {

          },
          //  home: LocationScreen(),
          getPages: RouteHelper.routes,
          defaultTransition: Transition.rightToLeftWithFade,
          //  home: home_Client_screen(),
          transitionDuration: const Duration(milliseconds: 400),
          home:const SplashScreen(),
        )
    );
  }}
