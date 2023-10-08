part of 'bloc_tab_bar.dart';

class TabBarInitialState {
  final List<Product> categoryProducts;

  TabBarInitialState({
    required this.categoryProducts,
  });
}

class TabBarFilteredState extends TabBarInitialState{
  TabBarFilteredState({required super.categoryProducts});

}