import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_shop_app/state_management/bloc_theme/bloc_theme.dart';

import 'navigation/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SwitchThemeBloc>(
      create: (_) => SwitchThemeBloc(),
      child: BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
          builder: (context, state) {
        return MaterialApp(
          theme: state.switchValue
              ? appThemeDate[AppTheme.dark]
              : appThemeDate[AppTheme.light],
          home: const MainBottomBarNavigation(),
        );
      }),
    );
  }
}
