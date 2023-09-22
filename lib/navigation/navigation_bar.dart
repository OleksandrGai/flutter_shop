import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/model/products_data.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/home_screen.dart';
import 'package:flutter_shop_app/widgets/home_screen_widgets/products_details.dart';

import '../screens/basket_screen_directory/basket_screen.dart';
import '../screens/favorits_screen_directory/favorite_screen.dart';
import '../screens/list_of_categories_screen_directory/list_of_categories_screen.dart';
import '../screens/person_screen_directory/person_screen.dart';
import '../screens/search_screen_directory/search_screen.dart';
import '../state_management/bloc_favorite_screen/bloc_favorite_screen.dart';

class MainBottomBarNavigation extends StatefulWidget {
  const MainBottomBarNavigation({super.key});

  @override
  State<StatefulWidget> createState() => MainBottomBarNavigationState();
}

class MainBottomBarNavigationState extends State<MainBottomBarNavigation> {
  var _currentIndex = 0;

  late final _routingWidgetBuilderMap = <String, WidgetBuilder>{
    HomeScreen.routeName: (_) => HomeScreen(
          onSearchClicked: onSearchClicked,
        ),
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

  final _items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: '1',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_outlined),
      label: '1',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: BlocBuilder<FavoriteScreenBloc, FavoriteScreenState>(
          builder: (context, state) {
        int productCount = state.favoriteList.length;
        if (state.favoriteList.isEmpty) {
          return const Icon(Icons.favorite_border_outlined);
        } else {
          return Stack(children: [
            const Icon(Icons.favorite_border_outlined),
            Container(
              // padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              constraints: const BoxConstraints(
                minHeight: 15,
                maxWidth: 12,
              ),
              child: Text(
                '$productCount',
                style: TextStyle(fontSize: 15),
              ),
            )
          ]);
        }
      }),
      label: '1',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket_outlined),
      label: '1',
    ),
    const BottomNavigationBarItem(
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
          if (settings.name == ProductsDetails.routeName) {
            final args = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) {
                return ProductsDetails(
                  id: args.id,
                  description: args.description,
                  title: args.title,
                  price: args.price.toString(),
                  image: args.image,
                );
              },
            );
          }
          return MaterialPageRoute(
            builder:
                _routingWidgetBuilderMap[settings.name] ?? (_) => Container(),
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
