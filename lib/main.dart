import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_app/state_management/bloc_favorite_screen/bloc_favorite_screen.dart';

import 'package:flutter_shop_app/state_management/bloc_theme/bloc_theme.dart';
import 'package:flutter_shop_app/state_management/language/bloc_locale/bloc_locale.dart';

import 'navigation/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SwitchThemeBloc>(
            create: (_) => SwitchThemeBloc(),
          ),
          BlocProvider<LanguageBloc>(
            create: (_) => LanguageBloc(),
          ),
          BlocProvider<FavoriteScreenBloc>(
            create: (_) => FavoriteScreenBloc(),
          ),
        ],
        child: BlocProvider<SwitchThemeBloc>(
          create: (_) => SwitchThemeBloc(),
          child: BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
              builder: (context, state) {
            return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context2, locale) {
                return MaterialApp(
                  theme: state.switchValue
                      ? appThemeDate[AppTheme.dark]
                      : appThemeDate[AppTheme.light],
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  locale: locale.language.value,
                  home: const MainBottomBarNavigation(),
                );
              },
            );
          }),
        ));
  }
}
