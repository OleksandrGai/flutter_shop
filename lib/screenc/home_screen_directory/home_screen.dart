import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/woman_home_screen.dart';
import 'package:provider/provider.dart';

import '../../navigation/navigation_bar.dart';
import '../../theme/theme_notifier.dart';

import '../../widgets/home_screen_widgets/text_field.dart';
import '../../widgets/home_screen_widgets/sex_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          theme: value.getTheme,
          home: Scaffold(
              bottomNavigationBar: MainBottomBarNavigation(),
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 14, right: 14),
                      child: HomeTextFieldWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14, right: 14),
                      child: SexTabBar(),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
