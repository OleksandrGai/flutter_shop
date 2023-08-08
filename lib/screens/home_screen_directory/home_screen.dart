import 'package:flutter/material.dart';
import '../../widgets/home_screen_widgets/text_field.dart';
import '../../widgets/home_screen_widgets/consumer_tab_bar.dart';
import '../search_screen_directory/search_screen.dart';

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
            const Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: HomeTextFieldWidget(),
            ),
            TextButton(
              onPressed: onSearchClicked,
              child: const Text('tab'),
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
