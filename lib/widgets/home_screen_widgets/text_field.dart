import 'package:flutter/material.dart';

class HomeTextFieldWidget extends StatelessWidget {
  const HomeTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void navigationToSearchScreen() {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/searchScreen', (route) => false);
    }

    return TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Theme.of(context).inputDecorationTheme.focusColor,
          ),
          suffixIcon: Icon(Icons.camera_alt_outlined,
              color: Theme.of(context).inputDecorationTheme.focusColor),
        ),
        cursorColor: Colors.grey.shade400);
  }
}
