import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/screens/search_screen_directory/search_screen.dart';

import 'package:flutter_shop_app/state_management/bloc_tab_bar/bloc_tab_bar.dart';
import 'package:flutter_shop_app/state_management/bloc_theme/bloc_theme.dart';

import 'navigation/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocTheme>(
      create: (_) => BlocTheme(),
      child: BlocBuilder<BlocTheme, ThemeData>(builder: (context, state) {
        return MaterialApp(
          theme: state,
          home: const MainBottomBarNavigation(),
        );
      }),
    );
  }
}
