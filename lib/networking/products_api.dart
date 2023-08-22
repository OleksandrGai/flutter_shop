import 'package:flutter_shop_app/model/products_data.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

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

Future<List<Products1>> fetchAllProducts() async {
  String link = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    return json
        .map((dynamic e) => Products1.fromJson(e as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Products1>> fetchWomanProducts() async {
  String link = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    List<Products1> productsList = json
        .map((dynamic e) => Products1.fromJson(e as Map<String, dynamic>))
        .toList();
    final List<Products1> womanProducts = productsList
        .where((category) => category.category == "women's clothing")
        .toList();
    return womanProducts;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Products1>> fetchManProducts() async {
  String link = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    List<Products1> productsList = json
        .map((dynamic e) => Products1.fromJson(e as Map<String, dynamic>))
        .toList();
    final List<Products1> manProducts = productsList
        .where((category) => category.category == "men's clothing")
        .toList();
    return manProducts;
  } else {
    throw Exception('Failed to load album');
  }
}


