import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  static const String routeName = '/searchScreen';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Search Screen'),
        ),
      ),
    );
  }
}
