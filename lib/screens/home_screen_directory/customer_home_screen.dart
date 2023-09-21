import 'package:flutter/material.dart';
import 'package:flutter_shop_app/model/products_data.dart';

import '../../state_management/product_inherit/product_inherited_widget.dart';
import '../../widgets/home_screen_widgets/brands_grid_widget.dart';
import '../../widgets/home_screen_widgets/container_of_products_for_sex.dart';

class CustomerHomeScreen extends StatefulWidget {
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;

  const CustomerHomeScreen({
    super.key,
    required this.firstImage,
    required this.secondImage,
    required this.thirdImage,
    required this.fourthImage,
    required this.productsCategory,
  });

  final List<Product> productsCategory;
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 14, right: 14),
      child: ListView(
        children: [
          Image.asset(widget.firstImage),
          const SizedBox(
            height: 20,
          ),
          Image.asset(widget.secondImage),
          const SizedBox(
            height: 20,
          ),
          ProductInherit(productsCategory: widget.productsCategory, child: const ContainerProductsList()),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Рекомендовані бренди',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          const BrandsGridWidget(),
          const SizedBox(
            height: 20,
          ),
          Image.asset(widget.thirdImage),
          const SizedBox(
            height: 20,
          ),
          Image.asset(widget.fourthImage),
        ],
      ),
    );
  }
}
