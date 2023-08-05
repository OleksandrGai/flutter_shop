import 'package:flutter/material.dart';
import '../../widgets/search_screen_widgets/text_field_search_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child:
        SingleChildScrollView(child: TextFieldSearchScreen()),
      ),
    );
  }
}
