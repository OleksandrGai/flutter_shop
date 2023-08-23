import 'package:bloc/bloc.dart';
import 'package:flutter_shop_app/state_management/bloc_locale/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

const languagePrefsKey = 'languagePrefs';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(language: Language.english)) {
    on<UkraineLanguageEvent>(
      (event, emit) => emit(
        LanguageState(
          language: Language.ukraine,
        ),
      ),
    );
    on<EnglishLanguageEvent>(
      (event, emit) => emit(
        LanguageState(
          language: Language.english,
        ),
      ),
    );
  }
}

class LanguageState {
  LanguageState({required this.language});

  final Language language;
}

abstract class LanguageEvent {
  LanguageEvent({required this.language});

  final Language language;
}

class UkraineLanguageEvent extends LanguageEvent {
  UkraineLanguageEvent({super.language = Language.ukraine});
}

class EnglishLanguageEvent extends LanguageEvent {
  EnglishLanguageEvent({super.language = Language.english});
}
