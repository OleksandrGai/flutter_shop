import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/home_screen.dart';

import '../screenc/home_screen_directory/woman_home_screen.dart';

class NavigationRouts extends StatelessWidget {
  const NavigationRouts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mainhome',
      routes: {
        '/mainhome': (context) => HomeScreen(),
       // '/woman' : (context) => WomenHomeScreen(),

        // '/maincategories' : (context) => CategoriesScreen(),
        // '/mainsearch' : (context) => SearchScreen(),
        // '/mainfavorites' : (context) => FavoritesScreen(),
        // '/mainbasket' : (context) => BasketScreen(),
        // '/mainprofile' : (context) => BasketScreen(),
      },
    );
  }
}
