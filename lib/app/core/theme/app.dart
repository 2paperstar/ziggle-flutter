import 'package:flutter/material.dart';
import 'package:ziggle/app/core/theme/text.dart';
import 'package:ziggle/app/core/values/colors.dart';
import 'package:ziggle/gen/fonts.gen.dart';

final appTheme = ThemeData(
  fontFamily: FontFamily.notoSansKR,
  useMaterial3: true,
  scaffoldBackgroundColor: Palette.white,
  primaryColor: Palette.primaryColor,
  splashFactory: NoSplash.splashFactory,
  colorScheme: ColorScheme.fromSeed(seedColor: Palette.primaryColor),
  textTheme: const TextTheme(
    bodyMedium: TextStyles.defaultStyle,
    titleLarge: TextStyles.titleTextStyle,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Palette.white,
    foregroundColor: Palette.black,
    centerTitle: true,
    elevation: 0,
  ),
  dividerTheme: const DividerThemeData(
    color: Palette.light,
    thickness: 16,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Palette.white,
    elevation: 0,
    selectedItemColor: Palette.primaryColor,
    unselectedItemColor: Palette.secondaryText,
    selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  ),
);