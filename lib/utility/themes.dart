import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spyke/utility/constants.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: primaryColorLight,
    iconTheme:
        const IconThemeData(color: accentColorLight, size: defaultIconSize),
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      color: primaryColorLight,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    ),
    fontFamily: 'Segoa UI',
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: primaryColorDark,
        fontStyle: FontStyle.normal,
        fontSize: fontSizeSmall,
      ),
      hintStyle: TextStyle(
        color: primaryColorDark,
      ),
      iconColor: primaryColorDark,
      prefixIconColor: primaryColorDark,
      suffixIconColor: primaryColorDark,
      contentPadding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: primaryColorLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: primaryColorDark,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: primaryColorLight,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColorLight,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: fontSizeSmall,
          ),
          primary: primaryColorLight,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)))),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    colorScheme: const ColorScheme.dark(),
    fontFamily: 'Segoa UI',
    iconTheme:
        const IconThemeData(color: primaryColorLight, size: defaultIconSize),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: primaryColorLight,
        fontStyle: FontStyle.normal,
        fontSize: fontSizeSmall,
      ),
      hintStyle: TextStyle(
        color: primaryColorLight,
      ),
      iconColor: primaryColorLight,
      prefixIconColor: primaryColorLight,
      suffixIconColor: primaryColorLight,
      contentPadding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: primaryColorLight,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: primaryColorLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: accentColorLight,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: primaryColorDark,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColorLight,
          primary: primaryColorLight,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: fontSizeSmall,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kDefaultRadius)))),
    ),
  );
}
