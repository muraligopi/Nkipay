import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Nkipay/utils/constants.dart';

final themeProvider = ChangeNotifierProvider(((ref) => CustomThemeProvider()));

class CustomThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeData get getCurrentTheme =>
      isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme;

  void changeTheme(bool? val) {
    if (val != null) {
      themeMode = val ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: kPrimaryColor,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, 56),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: kPrimaryLightColor,
      iconColor: kPrimaryColor,
      prefixIconColor: kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Color(0xFF6F35A5),
    iconTheme: const IconThemeData(color: kPrimaryColor),
    primarySwatch: Colors.yellow,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kBackgroundColor))),
  );
  static final darkTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: kPrimaryColor,
          shape: const StadiumBorder(),
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(double.infinity, 56),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: kPrimaryLightColor,
        iconColor: kPrimaryColor,
        prefixIconColor: kPrimaryColor,
        contentPadding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
      scaffoldBackgroundColor: Color.fromARGB(255, 26, 33, 39),
      colorScheme: const ColorScheme.dark(),
      primarySwatch: Colors.yellow,
      primaryColor: const Color(0xFFFFD800),
      iconTheme: IconThemeData(color: Colors.grey[400]),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )));
}
