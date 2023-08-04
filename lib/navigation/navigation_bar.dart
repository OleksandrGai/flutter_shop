import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/home_screen.dart';

import '../screens/basket_screen_directory/basket_screen.dart';
import '../screens/favorits_screen_directory/favorite_screen.dart';
import '../screens/list_of_categories_screen_directory/list_of_categories_sreen.dart';
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
        for (int index = 0; index < 6; index++)
          Offstage(
            offstage: _currentIndex != index,
            child: TabNavigator(
              tabIndex: index,
            ),
          ),
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
}

class TabNavigatorRoutes {
  static String homeScreen = '/';
  static String listScreen = '/listScreen';
  static String searchScreen = '/searchScreen';
  static String favoriteScreen = '/favoriteScreen';
  static String basketScreen = '/basketScreen';
  static String personScreen = '/personScreen';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key, required this.tabIndex});

  final int tabIndex;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
  //  print(tabIndex);
    return {
      TabNavigatorRoutes.homeScreen: (context) => _getScreen(tabIndex),
      TabNavigatorRoutes.listScreen: (context) => _getScreen(tabIndex),
      TabNavigatorRoutes.searchScreen: (context) => _getScreen(tabIndex),
      TabNavigatorRoutes.favoriteScreen: (context) => _getScreen(tabIndex),
      TabNavigatorRoutes.basketScreen: (context) => _getScreen(tabIndex),
      TabNavigatorRoutes.personScreen: (context) => _getScreen(tabIndex),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      initialRoute: TabNavigatorRoutes.homeScreen,
      onGenerateRoute: (routeSettings) {

        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return routeBuilders[routeSettings.name]!(context);
          },
        );
      },
    );
  }

  _getScreen(int item) {
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

// class TabNavigatorRoutes {
//   int? rootIndex;
//
//   String get root => rootIndex.toString();
// }
//
// class TabNavigator extends StatelessWidget {
//   const TabNavigator({super.key, required this.tabIndex});
//
//   final int tabIndex;
//
//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
//
//     return {TabNavigatorRoutes().root: (context) => _getScreen(tabIndex)};
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilders(context);
//     return Navigator(
//       initialRoute: TabNavigatorRoutes().root,
//       onGenerateRoute: (routeSettings) {
//         print(TabNavigatorRoutes().rootIndex);
//         return MaterialPageRoute(
//           settings: routeSettings,
//           builder: (context) => routeBuilders[routeSettings.name]!(context),
//         );
//       },
//     );
//   }
//
//   _getScreen(int item) {
//     switch (item) {
//       case 0:
//         return const HomeScreen();
//       case 1:
//         return const ListOfCategoriesScreen();
//       case 2:
//         return const SearchScreen();
//       case 3:
//         return const FavoriteScreen();
//       case 4:
//         return const BasketScreen();
//       case 5:
//         return const PersonScreen();
//       default:
//         return const Scaffold();
//     }
//   }
// }
