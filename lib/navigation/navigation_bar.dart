import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/home_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/basket_screen_directory/basket_screen.dart';
import '../screens/favorits_screen_directory/favorite_screen.dart';
import '../screens/list_of_categories_screen_directory/list_of_categories_sreen.dart';
import '../screens/person_screen_directory/person_screen.dart';
import '../screens/search_screen_directory/search_screen.dart';

// class MainBottomBarNavigation extends StatefulWidget {
//   const MainBottomBarNavigation({super.key});
//
//   @override
//   State<MainBottomBarNavigation> createState() =>
//       _MainBottomBarNavigationState();
// }
//
// class _MainBottomBarNavigationState extends State<MainBottomBarNavigation> {
//   var _initialIndex = 0;
//   List<Widget> _screens = [
//     HomeScreen(),
//     SearchScreen(),
//   ];
//   final _items = const <BottomNavigationBarItem>[
//     BottomNavigationBarItem(
//       icon: Icon(Icons.home_outlined),
//       label: '1',
//     ),
//     // BottomNavigationBarItem(
//     //   icon: Icon(Icons.list_outlined),
//     //   label: '1',
//     // ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.search_outlined),
//       label: '1',
//     ),
//     // BottomNavigationBarItem(
//     //   icon: Icon(Icons.favorite_border_outlined),
//     //   label: '1',
//     // ),
//     // BottomNavigationBarItem(
//     //   icon: Icon(Icons.shopping_basket_outlined),
//     //   label: '1',
//     // ),
//     // BottomNavigationBarItem(
//     //   icon: Icon(
//     //     Icons.person,
//     //   ),
//     //   label: '1',
//     // ),
//   ];
//
//   void _indexNavigation(int tabIndex) {
//     if (_initialIndex == tabIndex) return;
//     setState(() {
//       _initialIndex = tabIndex;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_initialIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: _items,
//         currentIndex: _initialIndex,
//         onTap: _indexNavigation,
//       ),
//     );
//   }
// }

class MainBottomBarNavigation extends StatefulWidget {
  const MainBottomBarNavigation({super.key});

  @override
  State<MainBottomBarNavigation> createState() =>
      _MainBottomBarNavigationState();
}

class _MainBottomBarNavigationState extends State<MainBottomBarNavigation> {
  @override
  PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      ListOfCategoriesScreen(),
      SearchScreen(),
      FavoriteScreen(),
      BasketScreen(),
      PersonScreen(),
    ];
  }

  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: [
        PersistentBottomNavBarItemConstructor(
          icon: const Icon(Icons.home_outlined),
          activeColorPrimary: Theme.of(context).focusColor,
          inactiveColorPrimary: Theme.of(context).unselectedWidgetColor,
        ),
        PersistentBottomNavBarItemConstructor(
          icon: const Icon(Icons.list_outlined),
          activeColorPrimary: Theme.of(context).focusColor,
          inactiveColorPrimary: Theme.of(context).unselectedWidgetColor,
        ),
        PersistentBottomNavBarItemConstructor(
          icon: const Icon(Icons.search_outlined),
          activeColorPrimary: Theme.of(context).focusColor,
          inactiveColorPrimary: Theme.of(context).unselectedWidgetColor,
        ),
        PersistentBottomNavBarItemConstructor(
          icon: const Icon(Icons.favorite_border_outlined),
          activeColorPrimary: Theme.of(context).focusColor,
          inactiveColorPrimary: Theme.of(context).unselectedWidgetColor,
        ),
        PersistentBottomNavBarItemConstructor(
          icon: const Icon(Icons.shopping_basket_outlined),
          activeColorPrimary: Theme.of(context).focusColor,
          inactiveColorPrimary: Theme.of(context).unselectedWidgetColor,
        ),
        PersistentBottomNavBarItemConstructor(
          icon: const Icon(Icons.person),
          activeColorPrimary: Theme.of(context).focusColor,
          inactiveColorPrimary: Theme.of(context).unselectedWidgetColor,
        ),
      ],
      navBarStyle: NavBarStyle.style3,
      decoration: NavBarDecoration(),
    );
  }
}

class PersistentBottomNavBarItemConstructor extends PersistentBottomNavBarItem {
  PersistentBottomNavBarItemConstructor(
      {required this.activeColorPrimary,
      required this.inactiveColorPrimary,
      required super.icon});

  @override
  final Color activeColorPrimary;
  @override
  final Color inactiveColorPrimary;
}
