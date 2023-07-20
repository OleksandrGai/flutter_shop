import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/woman_home_screen.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_notifier.dart';

import '../../widgets/home_screen_widgets/text_field.dart';
import '../../widgets/home_screen_widgets/toggle_buttons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          theme: value.getTheme,
          home: const Scaffold(
              body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: HomeTextFieldWidget(),
                ),
                SexToggleButtons(),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: Divider(
                    height: 3,
                    thickness: 1.8,
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(14),
                  child: WomenHomeScreen(),
                )),
              ],
            ),
          )),
        );
      },
    );
  }
}
