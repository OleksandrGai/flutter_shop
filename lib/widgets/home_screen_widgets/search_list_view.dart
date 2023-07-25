import 'package:flutter/material.dart';

import '../../model/products_data.dart';

class HomeSearchListWidget extends StatelessWidget {
  HomeSearchListWidget({super.key, required this.productsTypeList});

  List<TestProducts> productsTypeList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: productsTypeList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(productsTypeList[index].typeOfProducts),
            );
          }),
    );
  }
}
