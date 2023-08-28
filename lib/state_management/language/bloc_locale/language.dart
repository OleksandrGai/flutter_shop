import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  ukraine(
    Locale('uk', 'UKR'),
    'Ukraine',
  );

  const Language(this.value, this.text);

  final Locale value;

  final String text;
}
