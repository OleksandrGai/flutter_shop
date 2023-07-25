import 'package:flutter/material.dart';
import '../../navigation/navigation_bar.dart';

import '../../widgets/home_screen_widgets/text_field.dart';
import '../../widgets/home_screen_widgets/sex_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomBarNavigation(),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: HomeTextFieldWidget(),
            ),
            Flexible(
              child: ListView(
                children: const [
                  SexTabBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TextButton(
//     onPressed: () {
//       final cubit = context.read<ThemeCubit>();
//       cubit.themeChange();
//     },
//     child: Text('jjj')),
