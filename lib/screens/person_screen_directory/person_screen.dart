import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {

  static const String routeName = '/personScreen';

  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Person Screen'),
        ),
      ),
    );
  }
}
