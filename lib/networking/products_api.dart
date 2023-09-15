import 'package:flutter_shop_app/model/products_data.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ProductsApi {
  factory ProductsApi() => _ProductsApiImpl();

  Future<List<Product>> _fetchAllProducts();

  Future<List<Product>> fetchWomanProducts();

  Future<List<Product>> fetchManProducts();
}

class _ProductsApiImpl implements ProductsApi {
  static const _baseurl = 'https://fakestoreapi.com';
  static const _typesPath = '/products';

  Future<T> _getRequest<T>(
    Uri uri,
    T Function(List<dynamic>) parser,
  ) async {
    final response = await http.get(uri);
    final jsonResp = json.decode(response.body);
    return parser(jsonResp);
  }

  @override
  Future<List<Product>> _fetchAllProducts(
      {bool Function(Product)? filter}) async {
    return _getRequest(Uri.parse('$_baseurl$_typesPath'), (json) {
      var res = json;
      return res
          .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .where(filter ?? (_) => true)
          .toList();
    });
  }

  @override
  Future<List<Product>> fetchManProducts() async {
    return _fetchAllProducts(
        filter: (category) => category.category == "men's clothing");
  }

  @override
  Future<List<Product>> fetchWomanProducts() {
    return _fetchAllProducts(
        filter: (category) => category.category == "women's clothing");
  }
}

List<Products> listOfCategories = [
  TestProducts('Взуття'),
  TestProducts('Футболки'),
  TestProducts('Штани'),
  TestProducts('Куртки'),
  TestProducts('Носки'),
  TestProducts('Білизна'),
  TestProducts('Аксесуари'),
  TestProducts('Духи'),
  TestProducts('Рушники'),
  TestProducts('Сандалі'),
  TestProducts('Лофери'),
  TestProducts('Еспадрилі'),
  TestProducts('Челсі'),
  TestProducts('Леггинси'),
  TestProducts('Спортивний одяг'),
];
