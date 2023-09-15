import 'package:flutter/material.dart';

import '../../widgets/home_screen_widgets/text_field.dart';
import '../../widgets/home_screen_widgets/consumer_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key, required this.onSearchClicked});

  final VoidCallback onSearchClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: HomeTextFieldWidget(
                  onSearchClickedTextField: onSearchClicked),
            ),
            Flexible(
              child: ListView(
                children: const [
                  ConsumerTabBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
