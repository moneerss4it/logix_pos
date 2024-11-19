import 'package:flutter/material.dart';

class LightColor {
  LightColor._();
  static const Color primary = Color(0xff0792AD);
  static const Color primaryColorLight = Color(0xff3dc4de);
  static const Color primaryColorDark = Color(0xff027288);
  static const Color selectedWidgetColor = Color(0xff0792AD);

  static const Color cardColor = Color(0xffffffff);
  static const Color cardColor1 = Color(0xff0792AD);
  static const Color dividerColor = Color(0xff0792AD);
  static const Color indicator = Color(0xFFFAF8F8);
  static const Color background = Color(0xFFF5F5F5);
  // static const Color background = Color(0xffffffff);

  static const Color bottomAppBarColor = Color(0xffffffff);
  static const Color appBarBackground = Color(0xff027288);

  static const Color inputFill = Color(0xFFFFFFFF);
  static const Color error = Colors.red;
  static const Color successColor = Color(0xff43A047);
  static const Color carefulColor = Color(0xfffab86a);
  static const Color hint = Colors.black26;
  static const Color hoverColor = Colors.black;
  static const Color highlightColor = Color(0xffE0E0E0);
  static const Color selectedRowColor = Color(0xffEEEEEE);

  static const Color splashColor = Colors.white;

  static const Color magenta100 = Color(0xfffdf7f7);
  static const Color magenta300 = Color(0xfff5cbca);
  static const Color magenta400 = Color(0xfffabcbb);
  static const Color magenta900 = Color(0xfffda7a5);
  static const Color magenta600 = Color(0xffd97674);
  static const Color surfaceWhite = Color(0xFFFFFBFA);
  static const Color redLight = Color(0xFFEDE4E4);
  static const Color brownLight = Color(0xFFFDEBDD);
  static const Color greenLight  = Color(0xFFE7EBEA);
  static const Color orangeLight  = Color(0xFFF9F5EF);


  static const Color unselectedWidgetColor = Colors.grey;
  static  MaterialColor primarySwatch =buildMaterialColor(primaryColorLight);
//     MaterialColor(0xff1C0758, <int, Color>{
//   900: Color(0xff000051), //10%
//   800: Color(0xff000b5a), //20%
//   700: Color(0xff001461), //30%
//   600: Color(0xff00236d), //40%
//   500: Color(0xff003178), //50%
//   400: Color(0xff004185), //60%
//   300: Color(0xff005495), //70%
//   200: Color(0xff006ca9), //80%
//   100: Color(0xff007fb8), //90%
//   50: Color(0xff008ec5), //1
// });
}

class DarkColor {
  DarkColor._();
  static const Color primary = Color(0xFF303134);
  static const Color primaryColorLight = Color(0xFF3C3D42);
  static const Color primaryColorDark = Color(0xFF000000);

  static const Color cardColor = Color(0xFF303134);
  static const Color dividerColor = Color(0xFFBABFC4);
  static const Color indicator = Color(0xFFC5C5C5);
  static const Color background = Color(0xFF202124);

  static const Color appBarBackground = Color(0xFF303134);
  static const Color bottomAppBarColor = Color(0xff212121);

  static const Color inputFill = Color(0xFF303134);
  static const Color error = Colors.red;
  static const Color successColor = Color(0xff43A047);
  static const Color carefulColor = Color(0xff4CAF50);
  static const Color hint = Colors.white60;
  static const Color hoverColor = Color(0xffffffff);
  static const Color highlightColor = Color(0xff212121);
  static Color selectedRowColor = Color(0xff292A2D);

  static const Color splashColor = Colors.white;

  static const Color magenta100 = Color(0xffcceef5);
  static const Color magenta300 = Color(0xfff8ead0);
  static const Color magenta400 = Color(0xfff6ddae);
  static const Color magenta900 = Color(0xfff8d89b);
  static const Color magenta600 = Color(0xfff8cc76);

  static const Color surfaceWhite = Color(0xFF383333);
  static const Color unselectedWidgetColor = Colors.white38;
  static const Color selectedWidgetColor = Colors.white;
  static  MaterialColor primarySwatch =buildMaterialColor(background);

}
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}