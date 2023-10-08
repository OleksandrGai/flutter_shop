import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/model/products_data.dart';
import 'package:flutter_shop_app/networking/products_api.dart';

part 'bloc_tab_bar_event.dart';

part 'bloc_tab_bar_state.dart';

abstract class TabBarBloc extends Bloc<TabBarEvent, TabBarInitialState> {
  final ProductsApi _api;

  TabBarBloc(this._api) : super(TabBarInitialState(categoryProducts: [])) {
    on<TabBarEvent>(productFetcher);
    on<FilterEvent>(productFilter);

 //   add(WomanTabBarEvent());
//    add(ManTabBarEvent());
  }

  void productFetcher(TabBarEvent event, Emitter<TabBarInitialState> emit);

  void productFilter(TabBarEvent event, Emitter<TabBarInitialState> emit);
}

class WomanTab extends TabBarBloc {
  WomanTab(super.api);

  List<Product>? result;

  @override
  void productFetcher(
      TabBarEvent event, Emitter<TabBarInitialState> emit) async {
    if (event is WomanTabBarEvent) {
      result = await _api.fetchWomanProducts();
      emit(TabBarInitialState(categoryProducts: result!));
    }
  }

  @override
  void productFilter(
      TabBarEvent event, Emitter<TabBarInitialState> emit) async {
    if (event is FilterEvent) {
      List<Product> allProducts = await _api.fetchWomanProducts();
      List<Product> foundProducts = allProducts;
      List<Product> result = [];
      if (event.enteredString.isEmpty) {
        result = allProducts;
      } else {
        result = allProducts
            .where((product) => product.title
                .toLowerCase()
                .contains(event.enteredString.toLowerCase()))
            .toList();
        foundProducts = result;
        print('woman - $foundProducts');
        //  emit(TabBarFilteredState(categoryProducts: foundProducts));
      }
      emit(TabBarFilteredState(categoryProducts: foundProducts));
    }
  }
}

class ManTab extends TabBarBloc {
  ManTab(super.api);

  List<Product>? result;

  @override
  void productFetcher(
      TabBarEvent event, Emitter<TabBarInitialState> emit) async {
    if (event is ManTabBarEvent) {
      result = await _api.fetchManProducts();
      emit(TabBarInitialState(categoryProducts: result!));
    }
  }

  @override
  void productFilter(
      TabBarEvent event, Emitter<TabBarInitialState> emit) async {
    if (event is FilterEvent) {
      List<Product> allProducts = await _api.fetchManProducts();
      List<Product> foundProducts = allProducts;
      List<Product> result = [];
      if (event.enteredString.isEmpty) {
        result = allProducts;
      } else {
        result = allProducts
            .where((product) => product.title
                .toLowerCase()
                .contains(event.enteredString.toLowerCase()))
            .toList();
        foundProducts = result;
        //print('man - $foundProducts');
      }
      print('man - $foundProducts');
      emit(TabBarFilteredState(categoryProducts: foundProducts));
    }
  }
}
