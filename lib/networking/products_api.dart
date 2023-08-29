import 'package:flutter_shop_app/model/products_data.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ProductsApi {
  factory ProductsApi() => _ProductsApiImpl();

  Future<List<Products1>> fetchAllProducts();

  Future<List<Products1>> fetchWomanProducts();

  Future<List<Products1>> fetchManProducts();
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
  Future<List<Products1>> fetchAllProducts() async {
    return _getRequest(Uri.parse('$_baseurl$_typesPath'), (json) {
      var res = json;
      return res
          .map((dynamic e) => Products1.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<Products1>> fetchManProducts() async {
    return _getRequest(Uri.parse('$_baseurl$_typesPath'), (json) {
      var res = json;
      return res
          .map((dynamic e) => Products1.fromJson(e as Map<String, dynamic>))
          .where((category) => category.category == "men's clothing")
          .toList();
    });
  }

  @override
  Future<List<Products1>> fetchWomanProducts() {
    return _getRequest(Uri.parse('$_baseurl$_typesPath'), (json) {
      var res = json;
      return res
          .map((dynamic e) => Products1.fromJson(e as Map<String, dynamic>))
          .where((category) => category.category == "women's clothing")
          .toList();
    });
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
