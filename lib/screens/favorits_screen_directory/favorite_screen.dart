import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {

  static const String routeName = '/favoriteScreen';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Favorite Screen'),
        ),
      ),
    );
  }
}
