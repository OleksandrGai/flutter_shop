import 'package:flutter/material.dart';

class HomeTextFieldWidget extends StatelessWidget {
  const HomeTextFieldWidget({super.key, required this.onSearchClickedTextField});

  final VoidCallback onSearchClickedTextField;

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: true,
        onTap:onSearchClickedTextField,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Theme
                .of(context)
                .inputDecorationTheme
                .focusColor,
          ),
          suffixIcon: Icon(Icons.camera_alt_outlined,
              color: Theme
                  .of(context)
                  .inputDecorationTheme
                  .focusColor),
        ),
        cursorColor: Colors.grey.shade400);
  }
}
