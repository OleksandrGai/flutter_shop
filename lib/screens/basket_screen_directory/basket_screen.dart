import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {

  static const String routeName = '/basketScreen';

  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Basket Screen'),
        ),
      ),
    );
  }
}
