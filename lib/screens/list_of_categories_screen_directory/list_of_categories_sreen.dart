import 'package:flutter/material.dart';

class ListOfCategoriesScreen extends StatelessWidget {

  static const String routeName = '/listScreen';

  const ListOfCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('List of categories Screen'),
        ),
      ),
    );
  }
}
