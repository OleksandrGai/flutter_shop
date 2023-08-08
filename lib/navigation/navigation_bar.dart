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

  late final _routingWidgetBuilderMap = <String, WidgetBuilder>{
    HomeScreen.routeName: (_) => HomeScreen(onSearchClicked: onSearchClicked,),
    ListOfCategoriesScreen.routeName: (_) => const ListOfCategoriesScreen(),
    SearchScreen.routeName: (_) => const SearchScreen(),
    FavoriteScreen.routeName: (_) => const FavoriteScreen(),
    BasketScreen.routeName: (_) => const BasketScreen(),
    PersonScreen.routeName: (_) => const PersonScreen(),
  };

  void onSearchClicked() => _userTab(2);

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
      body: NavigableStack(
        selectedIndex: _currentIndex,
        initialRoutes: _routingWidgetBuilderMap.keys.toList(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: _routingWidgetBuilderMap[settings.name] ?? (_) => Container(),
          );
        },

      ),
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

class NavigableStack extends StatelessWidget {
  const NavigableStack({
    super.key,
    required this.initialRoutes,
    required this.onGenerateRoute,
    required this.selectedIndex,
  });

  final List<String> initialRoutes;
  final RouteFactory onGenerateRoute;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        for (final initialRoute in initialRoutes)
          Navigator(
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
          ),
      ],
    );
  }
}
