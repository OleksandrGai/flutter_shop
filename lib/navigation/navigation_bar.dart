import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/home_screen.dart';

import '../screens/basket_screen_directory/basket_screen.dart';
import '../screens/favorits_screen_directory/favorite_screen.dart';
import '../screens/list_of_categories_screen_directory/list_of_categories_screen.dart';
import '../screens/person_screen_directory/person_screen.dart';
import '../screens/search_screen_directory/search_screen.dart';

class MainBottomBarNavigation extends StatefulWidget {
  const MainBottomBarNavigation({super.key});

  @override
  State<StatefulWidget> createState() => MainBottomBarNavigationState();
}

class MainBottomBarNavigationState extends State<MainBottomBarNavigation> {
  var _currentIndex = 0;

  void _userTab(int userTab) {
    if (userTab == _currentIndex) return;
    setState(() => _currentIndex = userTab);
  }

  final _items = const <BottomNavigationBarItem>[
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
      icon: Icon(
        Icons.person,
      ),
      label: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        _buildOffstageNavigator(0),
        _buildOffstageNavigator(1),
        _buildOffstageNavigator(2),
        _buildOffstageNavigator(3),
        _buildOffstageNavigator(4),
        _buildOffstageNavigator(5),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _items,
        currentIndex: _currentIndex,
        onTap: _userTab,
      ),
    );
  }

  Widget _buildOffstageNavigator(int tabItem) {
    return Offstage(
      offstage: _currentIndex != tabItem,
      child: TabNavigator(
        tabIndex: tabItem,
      ),
    );
  }
}

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key, required this.tabIndex});

  final int tabIndex;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => _getScreen(context, tabIndex)
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          settings: const RouteSettings(name: TabNavigatorRoutes.root),
          builder: (context) => routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }

  _getScreen(BuildContext context, int item) {
    switch (item) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ListOfCategoriesScreen();
      case 2:
        return const SearchScreen();
      case 3:
        return const FavoriteScreen();
      case 4:
        return const BasketScreen();
      case 5:
        return const PersonScreen();
      default:
        return const Scaffold();
    }
  }
}
