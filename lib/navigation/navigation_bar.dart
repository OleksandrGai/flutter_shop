import 'package:flutter/material.dart';

class MainBottomBarNavigation extends StatefulWidget {
  const MainBottomBarNavigation({super.key});

  @override
  State<MainBottomBarNavigation> createState() =>
      _MainBottomBarNavigationState();
}

class _MainBottomBarNavigationState extends State<MainBottomBarNavigation> {
  var _initialIndex = 0;
  final _mainScreens = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person,),
      label: '1',
    ),
  ];

  void _indexNavigation(int tabIndex) {
    if (_initialIndex == tabIndex) return;
    setState(() {
      _initialIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: _mainScreens,
      currentIndex: _initialIndex,
      onTap: _indexNavigation,
    );
  }
}
