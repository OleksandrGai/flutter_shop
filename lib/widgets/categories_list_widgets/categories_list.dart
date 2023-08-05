import 'package:flutter/material.dart';

import '../../model/products_data.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final List<Products> _productsCategory = [
    TestProducts('Новинки'),
    TestProducts('Одяг'),
    TestProducts('Взуття'),
    TestProducts('Аксесуари'),
    TestProducts('Спорт'),
    TestProducts('Преміум'),
    TestProducts('Для дому'),
    TestProducts('Бренди'),
    TestProducts('Розпродаж'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _productsCategory.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(_productsCategory[index].typeOfProducts),
            children: [
              Text(
                _productsCategory.toString(),
              )
            ],
          );
        });
  }
}
