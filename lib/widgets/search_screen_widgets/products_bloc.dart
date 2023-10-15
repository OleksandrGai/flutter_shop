import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_app/model/products_data.dart';

import '../../networking/products_api.dart';

abstract class ProductsBloc extends Bloc<_FetchProductsEvent, ProductsState> {

  final ProductsApi _api;
  final ProductsCategory _category;
  final ValueListenable<String?> _searchNotifier;

  ProductsBloc(this._api, this._category, this._searchNotifier): super(Products([])) {
    on<_FetchProductsEvent>((event, emit) async {
      emit(LoadingState());
      final result = await _api.fetchProducts(category: _category, searchQuery: event.query);
      emit(Products(result));
    });
    add(_FetchProductsEvent());
    _searchNotifier.addListener(_onSearchChangedListener);
  }

  void _onSearchChangedListener() {
    add(_FetchProductsEvent(query: _searchNotifier.value));
  }

  @override
  Future<void> close() {
    _searchNotifier.removeListener(_onSearchChangedListener);
    return super.close();
  }
}

abstract class ProductsState {}

class LoadingState implements ProductsState {}

class Products with ListBase<Product> implements ProductsState {
  
  final List<Product> _products;

  Products(this._products);

  @override
  int get length => _products.length;

  @override
  Product operator [](int index) {
    return _products[index];
  }

  @override
  void operator []=(int index, Product value) {
    _products[index] = value;
  }

  @override
  set length(int newLength) {
    _products.length = newLength;
  }
}

class _FetchProductsEvent {
  final String? query;

  _FetchProductsEvent({this.query});
}

class ManProductsBloc extends ProductsBloc {
  ManProductsBloc(ProductsApi api, ValueListenable<String?> notifier) : super(api, ProductsCategory.man, notifier);
}

class WomanProductsBloc extends ProductsBloc {
  WomanProductsBloc(ProductsApi api, ValueListenable<String?> notifier) : super(api, ProductsCategory.woman, notifier);
}

