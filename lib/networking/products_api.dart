import 'package:flutter_shop_app/model/products_data.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class ProductsApi {
  factory ProductsApi() => _ProductsApiImpl();

  Future<List<Product>> fetchProducts({ProductsCategory? category, String? searchQuery});

}

enum ProductsCategory {
  man("men's clothing"),
  woman("women's clothing");

  const ProductsCategory(this._categoryDetails);

  final String _categoryDetails;
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
  Future<List<Product>> fetchProducts(
      {ProductsCategory? category, String? searchQuery}) {
    return _getRequest(Uri.parse('$_baseurl$_typesPath'), (json) {
      var res = json;
      return res
          .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .where((element) => category == null
              ? true
              : element.category == category._categoryDetails)
          .where((element) => searchQuery == null
              ? true
              : element.title.toLowerCase().contains(searchQuery))
          .toList();
    });
  }
}
