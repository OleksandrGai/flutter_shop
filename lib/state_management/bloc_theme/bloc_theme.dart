import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class BlocTheme extends Bloc<BlocThemeTabEvent, ThemeData> {
  BlocTheme() : super(appThemeDate[AppTheme.light]!) {
    on<BlocThemeTabEvent>(
      (event, emit) => emit(
        state == appThemeDate[AppTheme.light]!
            ? appThemeDate[AppTheme.dark]!
            : appThemeDate[AppTheme.light]!,
      ),
    );
  }
}

class BlocThemeTabEvent {}

enum AppTheme {
  light,
  dark,
}

final Map<AppTheme, ThemeData> appThemeDate = {
  AppTheme.light: ThemeData(
    focusColor: Colors.black,
    brightness: Brightness.light,
    primaryColor: Colors.black,
    hintColor: Colors.black,
    fontFamily: 'Gill Sans',
    splashColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.shade400,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
      displaySmall: TextStyle(fontSize: 12, color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      focusColor: Colors.black,
      disabledColor: Colors.grey.shade400,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.black,
      focusColor: Colors.grey.shade400,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
    ),
  ),
  AppTheme.dark: ThemeData(
    focusColor: Colors.white,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    hintColor: Colors.white,
    fontFamily: 'Gill Sans',
    splashColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
      displaySmall: TextStyle(fontSize: 12, color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      focusColor: Colors.white,
      disabledColor: Colors.grey.shade400,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.white,
      focusColor: Colors.grey.shade400,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
    ),
  ),
};
