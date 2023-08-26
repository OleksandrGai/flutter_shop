import 'package:bloc/bloc.dart';
import 'package:flutter_shop_app/state_management/bloc_locale/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Language.english)) {
    on<ChangeLanguageEvent>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
    add(GetLanguage());
  }
}

class LanguageState {
  LanguageState(this.language);

  final Language language;
}

class ChangeLanguageState extends LanguageState {
  ChangeLanguageState(super.language);
}

abstract class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  ChangeLanguageEvent(this.language);

  final Language? language;
}

class GetLanguage extends LanguageEvent {}

abstract class SharedPref {
  static const String key = 'language_key';
}

onChangeLanguage(ChangeLanguageEvent event, Emitter<LanguageState> emit) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(
    SharedPref.key,
    event.language!.value.languageCode,
  );
  emit(ChangeLanguageState(event.language!));
}

onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
  final prefs = await SharedPreferences.getInstance();
  final language = prefs.getString(SharedPref.key);
  emit(ChangeLanguageState(
    language != null
        ? Language.values
            .where((item) => item.value.languageCode == language)
            .first
        : Language.english,
  ));
}
