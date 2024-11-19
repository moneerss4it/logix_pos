
import 'package:flutter/material.dart';

import '../app_phone_theme.dart';
import '../color.dart';


abstract class CustomLightTapTheme {
  CustomLightTapTheme._();
  static const TextStyle _customtitleMedium = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 24,
      fontWeight: FontWeight.w800);
  static const TextStyle _customtitleSmall = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 23,
      fontWeight: FontWeight.bold);
  static const TextStyle _custombodyLarge = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 22,
      fontWeight: FontWeight.bold);
  static const TextStyle _custombodyMedium = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static const TextStyle _customtitleLarge = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 20,
      fontWeight: FontWeight.normal);
  static const TextStyle _customheadlineSmall = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 19,
      fontWeight: FontWeight.normal);
  static const TextStyle _customheadlineMedium = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 18,
      fontWeight: FontWeight.normal);
  static const TextStyle _customdisplaySmall = TextStyle(
      color: LightColor.indicator, fontSize: 17, fontWeight: FontWeight.normal);
  static const TextStyle _customdisplayMedium = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 16,
      fontWeight: FontWeight.normal);
  static const TextStyle _customdisplayLarge = TextStyle(
      color: LightColor.dividerColor,
      fontSize: 15,
      fontWeight: FontWeight.normal);
  static const TextStyle _customHintText = TextStyle(
      color: LightColor.hint, fontSize: 17, fontWeight: FontWeight.normal);
  static const TextStyle _customErrorText = TextStyle(
      color: LightColor.error, fontSize: 16, fontWeight: FontWeight.normal);

  static const ColorScheme customColorScheme = ColorScheme(
    primary: LightColor.appBarBackground, //AppBar
   // primaryVariant: LightColor.magenta600,
    secondary: LightColor.primary, //flatBottom
 //   secondaryVariant: LightColor.magenta400,
    surface: LightColor.surfaceWhite,
    background: LightColor.surfaceWhite,
    error: LightColor.magenta900,
    onPrimary: LightColor.dividerColor, //appBarTitle
    onSecondary: LightColor.indicator, //Icon
    onSurface: LightColor.magenta300,
    onBackground: LightColor.magenta100,
    onError: LightColor.error,
    brightness: Brightness.light,
  );

  static const IconThemeData _customIconTheme = IconThemeData(
    color: LightColor.indicator,
  );

  static const TextTheme _customTextThem = TextTheme(
    titleMedium: _customtitleMedium,
    titleSmall: _customtitleSmall,
    bodyLarge: _custombodyLarge,
    bodyMedium: _custombodyMedium,
    displayLarge: _customdisplayLarge,
    displayMedium: _customdisplayMedium,
    displaySmall: _customdisplaySmall,
    headlineMedium: _customheadlineMedium,
    headlineSmall: _customheadlineSmall,
    titleLarge: _customtitleLarge,
  );

  static const AppBarTheme _customAppBarTheme = AppBarTheme(
    backgroundColor: LightColor.appBarBackground,
    elevation: 0,
    centerTitle: true,
    foregroundColor: LightColor.appBarBackground,
    titleTextStyle: _customtitleMedium,
    iconTheme: _customIconTheme,

  );

  static final CardTheme _customCardTheme = CardTheme(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.zero,
    elevation: 2,
    shadowColor: LightColor.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    color: LightColor.cardColor,
  );

  static const SnackBarThemeData _customSnackBarTheme =
      SnackBarThemeData(backgroundColor: LightColor.primary);

  static const InputDecorationTheme _customInputTextTheme =
      InputDecorationTheme(
    fillColor: LightColor.inputFill,
    filled: true,
    contentPadding: EdgeInsets.all(8.0),
    errorMaxLines: 2,
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.primary, width: 0)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: LightColor.primary, width: 0),
    ),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.primary, width: 0)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.primary, width: 0)),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: LightColor.primary, width: 0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0, color: LightColor.error)),
    errorStyle: _customErrorText,
    hintStyle: _customHintText,
    iconColor: LightColor.indicator,
    labelStyle: TextStyle(
        color: LightColor.dividerColor,
        fontSize: 20,
        fontWeight: FontWeight.normal),
    focusColor: LightColor.indicator,
  );

  static final OutlinedButtonThemeData _customOutlinedButton =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: _customheadlineMedium.copyWith(color: LightColor.indicator),
    //  primary: LightColor.primary,
      side: const BorderSide(
        color: LightColor.indicator,
        style: BorderStyle.solid,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
  static final ButtonStyle _customTextButtonTheme = TextButton.styleFrom(
     // primary: Colors.transparent,

      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      textStyle: _customheadlineMedium,
      backgroundColor:Colors.transparent);
  static final ButtonThemeData _customButtonTheme = ButtonThemeData(
      padding: const EdgeInsets.all(4),
      buttonColor: LightColor.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2.0, color: DarkColor.primary),
          borderRadius: BorderRadius.circular(10.0)));

  static final CheckboxThemeData _customCheckBoxThem = CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    fillColor: MaterialStateProperty.all<Color>(
      LightColor.primary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static const TimePickerThemeData _customTimePicker = TimePickerThemeData(
      dialTextColor: LightColor.cardColor,
      hourMinuteTextColor: LightColor.primary,
      helpTextStyle: _customdisplayLarge);

  static const BottomSheetThemeData _customBottomSheet = BottomSheetThemeData(
    backgroundColor: LightColor.background,
    modalBackgroundColor: LightColor.background,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(2.0),
        topRight: Radius.circular(2.0),
      ),
    ),
  );

  static const DividerThemeData _customDividerTheme = DividerThemeData(
    color: LightColor.hint,
  );

  static ThemeData lightTheme = ThemeData(
      radioTheme: RadioThemeData(

        fillColor: WidgetStateProperty.all(LightColor.unselectedWidgetColor),

      ),
      useMaterial3: true,
      fontFamily: AppFonts.cairo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColorDark: LightColor.primaryColorDark,
      primaryColorLight: LightColor.primaryColorLight,
      primaryColor: LightColor.primary,
      splashColor: LightColor.splashColor,
      scaffoldBackgroundColor: LightColor.background,
      hintColor: LightColor.hint,
      dividerColor: LightColor.dividerColor,
      indicatorColor: LightColor.indicator,
      unselectedWidgetColor: LightColor.unselectedWidgetColor,
      iconTheme: _customIconTheme,
      textTheme: _customTextThem,
      primaryTextTheme: _customTextThem,
      cardColor: LightColor.cardColor,
      dividerTheme: _customDividerTheme,
      cardTheme: _customCardTheme,
      appBarTheme: _customAppBarTheme,
      snackBarTheme: _customSnackBarTheme,
      inputDecorationTheme: _customInputTextTheme,
      outlinedButtonTheme: _customOutlinedButton,
      buttonTheme: _customButtonTheme,
      textButtonTheme: TextButtonThemeData(style: _customTextButtonTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
             // primary: LightColor.primary,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              textStyle: _customheadlineMedium,
              backgroundColor: LightColor.primary)
      ),
      tabBarTheme: const TabBarTheme(
        labelStyle: _customdisplayMedium,
        labelPadding: EdgeInsets.all(4),
      ),
      checkboxTheme: _customCheckBoxThem,
      timePickerTheme: _customTimePicker,
      bottomSheetTheme: _customBottomSheet,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: LightColor.primary,
      ),
      hoverColor: LightColor.hoverColor,
      secondaryHeaderColor: LightColor.appBarBackground,
      dialogBackgroundColor: LightColor.cardColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        hoverColor: LightColor.hoverColor,
        foregroundColor: LightColor.background,
        backgroundColor: LightColor.primary,
        splashColor: LightColor.splashColor,
        extendedTextStyle: _customheadlineSmall,
      ), bottomAppBarTheme: BottomAppBarTheme(color: LightColor.bottomAppBarColor), colorScheme: customColorScheme.copyWith(error: LightColor.error).copyWith(background: LightColor.background));
}

abstract class CustomDarkTapTheme {
  CustomDarkTapTheme._();
  static const TextStyle _customtitleMedium = TextStyle(
      color: DarkColor.dividerColor, fontSize: 24, fontWeight: FontWeight.w800);
  static const TextStyle _customtitleSmall = TextStyle(
      color: DarkColor.dividerColor, fontSize: 23, fontWeight: FontWeight.bold);
  static const TextStyle _custombodyLarge = TextStyle(
      color: DarkColor.dividerColor, fontSize: 22, fontWeight: FontWeight.bold);
  static const TextStyle _custombodyMedium = TextStyle(
      color: DarkColor.dividerColor, fontSize: 18, fontWeight: FontWeight.bold);
  static const TextStyle _customtitleLarge = TextStyle(
      color: DarkColor.dividerColor,
      fontSize: 20,
      fontWeight: FontWeight.normal);
  static const TextStyle _customheadlineSmall = TextStyle(
      color: DarkColor.dividerColor,
      fontSize: 19,
      fontWeight: FontWeight.normal);
  static const TextStyle _customheadlineMedium = TextStyle(
      color: DarkColor.dividerColor,
      fontSize: 18,
      fontWeight: FontWeight.normal);
  static const TextStyle _customdisplaySmall = TextStyle(
      color: DarkColor.indicator, fontSize: 17, fontWeight: FontWeight.normal);
  static const TextStyle _customdisplayMedium = TextStyle(
      color: DarkColor.dividerColor,
      fontSize: 16,
      fontWeight: FontWeight.normal);
  static const TextStyle _customdisplayLarge = TextStyle(
      color: DarkColor.dividerColor,
      fontSize: 15,
      fontWeight: FontWeight.normal);
  static const TextStyle _customHintText = TextStyle(
      color: DarkColor.hint, fontSize: 17, fontWeight: FontWeight.normal);
  static const TextStyle _customErrorText = TextStyle(
      color: DarkColor.error, fontSize: 16, fontWeight: FontWeight.normal);

  static const ColorScheme customColorScheme = ColorScheme(
    primary: DarkColor.appBarBackground, //AppBar
    //primaryVariant: DarkColor.magenta600,
    secondary: DarkColor.primary, //flatBottom
    //secondaryVariant: DarkColor.magenta400,
    surface: DarkColor.surfaceWhite,
    background: DarkColor.surfaceWhite,
    error: DarkColor.magenta900,
    onPrimary: DarkColor.dividerColor, //appBarTitle
    onSecondary: DarkColor.indicator, //Icon
    onSurface: DarkColor.magenta300,
    onBackground: DarkColor.magenta100,
    onError: DarkColor.error,
    brightness: Brightness.light,
  );

  static const IconThemeData _customIconTheme = IconThemeData(
    color: DarkColor.indicator,
  );

  static const TextTheme _customTextThem = TextTheme(
    titleMedium: _customtitleMedium,
    titleSmall: _customtitleSmall,
    bodyLarge: _custombodyLarge,
    bodyMedium: _custombodyMedium,
    displayLarge: _customdisplayLarge,
    displayMedium: _customdisplayMedium,
    displaySmall: _customdisplaySmall,
    headlineMedium: _customheadlineMedium,
    headlineSmall: _customheadlineSmall,
    titleLarge: _customtitleLarge,
  );

  static const AppBarTheme _customAppBarTheme = AppBarTheme(
    backgroundColor: DarkColor.appBarBackground,
    elevation: 0,
    centerTitle: true,
    foregroundColor: DarkColor.appBarBackground,
    titleTextStyle: _customtitleMedium,
    iconTheme: _customIconTheme,
  );

  static final CardTheme _customCardTheme = CardTheme(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.zero,
    elevation: 2,
    shadowColor: DarkColor.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    color: DarkColor.cardColor,
  );

  static const SnackBarThemeData _customSnackBarTheme =
      SnackBarThemeData(backgroundColor: DarkColor.primary);

  static const InputDecorationTheme _customInputTextTheme =
      InputDecorationTheme(
    fillColor: DarkColor.inputFill,
    filled: true,
    contentPadding: EdgeInsets.all(8.0),
    errorMaxLines: 2,
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.primary, width: 0)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: DarkColor.primary, width: 0),
    ),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.primary, width: 0)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.primary, width: 0)),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColor.primary, width: 0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0, color: DarkColor.error)),
    errorStyle: _customErrorText,
    hintStyle: _customHintText,
    iconColor: DarkColor.indicator,
    labelStyle: TextStyle(
        color: DarkColor.dividerColor,
        fontSize: 20,
        fontWeight: FontWeight.normal),
    focusColor: DarkColor.indicator,
  );

  static final OutlinedButtonThemeData _customOutlinedButton =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: _customheadlineMedium.copyWith(color: DarkColor.indicator),
      // primary: DarkColor.primary,
      side: const BorderSide(
        color: DarkColor.indicator,
        style: BorderStyle.solid,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
  static final ButtonStyle _customTextButtonTheme = TextButton.styleFrom(
      // primary:Colors.transparent,

      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      textStyle: _customheadlineMedium,
      backgroundColor: Colors.transparent);
  static final ButtonThemeData _customButtonTheme = ButtonThemeData(
      padding: const EdgeInsets.all(4),
      buttonColor: DarkColor.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2.0, color: DarkColor.primary),
          borderRadius: BorderRadius.circular(10.0)));

  static final CheckboxThemeData _customCheckBoxThem = CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.compact,
    fillColor: MaterialStateProperty.all<Color>(
      DarkColor.primary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static const TimePickerThemeData _customTimePicker = TimePickerThemeData(
      dialTextColor: DarkColor.cardColor,
      hourMinuteTextColor: DarkColor.primary,
      helpTextStyle: _customdisplayLarge);

  static const BottomSheetThemeData _customBottomSheet = BottomSheetThemeData(
    backgroundColor: DarkColor.background,
    modalBackgroundColor: DarkColor.background,
    clipBehavior: Clip.antiAlias,
    elevation:0 ,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(0.0),
      ),
    ),
  );

  static const DividerThemeData _customDividerTheme = DividerThemeData(
    color: DarkColor.hint,
  );

  static ThemeData darkTheme = ThemeData(
      fontFamily: AppFonts.cairo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColorDark: DarkColor.primaryColorDark,
      primaryColorLight: DarkColor.primaryColorLight,
      primaryColor: DarkColor.primary,
      splashColor: DarkColor.splashColor,
      scaffoldBackgroundColor: DarkColor.background,
      hintColor: DarkColor.hint,
      dividerColor: DarkColor.dividerColor,
      indicatorColor: DarkColor.indicator,
      unselectedWidgetColor: DarkColor.unselectedWidgetColor,
      iconTheme: _customIconTheme,
      textTheme: _customTextThem,
      primaryTextTheme: _customTextThem,
      cardColor: DarkColor.cardColor,
      dividerTheme: _customDividerTheme,
      cardTheme: _customCardTheme,

      appBarTheme: _customAppBarTheme,
      snackBarTheme: _customSnackBarTheme,
      inputDecorationTheme: _customInputTextTheme,
      outlinedButtonTheme: _customOutlinedButton,
      buttonTheme: _customButtonTheme,
      textButtonTheme: TextButtonThemeData(style: _customTextButtonTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              // primary: DarkColor.primary,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              textStyle: _customheadlineMedium,
              backgroundColor: DarkColor.primary)
      ),
      tabBarTheme: const TabBarTheme(
        labelStyle: _customdisplayMedium,
        labelPadding: EdgeInsets.all(4),
      ),
      checkboxTheme: _customCheckBoxThem,
      timePickerTheme: _customTimePicker,
      bottomSheetTheme: _customBottomSheet,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: DarkColor.primary,
      ),
      hoverColor: DarkColor.hoverColor,
      secondaryHeaderColor: DarkColor.appBarBackground,
      dialogBackgroundColor: DarkColor.cardColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        hoverColor: DarkColor.hoverColor,
        foregroundColor: DarkColor.background,
        backgroundColor: DarkColor.primary,
        splashColor: DarkColor.splashColor,
        extendedTextStyle: _customheadlineSmall,
      ), bottomAppBarTheme: BottomAppBarTheme(color: DarkColor.bottomAppBarColor), colorScheme: customColorScheme.copyWith( background: DarkColor.background).copyWith(error: DarkColor.error));
}
