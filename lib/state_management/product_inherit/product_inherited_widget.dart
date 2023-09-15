import 'package:flutter/material.dart';

import '../../model/products_data.dart';

class ProductInherit extends InheritedWidget {
  final List<Product> productsCategory;

  const ProductInherit({
    Key? key,
    required this.productsCategory,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(ProductInherit oldWidget) {
    return productsCategory != oldWidget.productsCategory;
  }
}

