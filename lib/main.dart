import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/home_screen.dart';
import 'package:flutter_shop_app/state_management/bloc_tab_bar/bloc_tab_bar.dart';
import 'package:flutter_shop_app/state_management/cubit_theme/cubit_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<TabBarBloc>(
          create: (_) => TabBarBloc(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) {
        return MaterialApp(
          theme: state,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
