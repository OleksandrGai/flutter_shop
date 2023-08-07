import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SwitchThemeBloc extends Bloc<SwitchThemeEvent, SwitchThemeState> {
  SwitchThemeBloc() : super(SwitchThemeState(switchValue: false)) {
    on<SwitchOnDarkThemeEvent>(
      (event, emit) => emit(
        SwitchThemeState(switchValue: true),
      ),
    );
    on<SwitchOffDarkThemeEvent>(
      (event, emit) => emit(
        SwitchThemeState(switchValue: false),
      ),
    );
  }
}

class SwitchThemeEvent {}

class SwitchOnDarkThemeEvent extends SwitchThemeEvent {}

class SwitchOffDarkThemeEvent extends SwitchThemeEvent {}

class SwitchThemeState {
  SwitchThemeState({required this.switchValue});

  final bool switchValue;
}

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
          fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
      displaySmall: TextStyle(fontSize: 15, color: Colors.black),
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
