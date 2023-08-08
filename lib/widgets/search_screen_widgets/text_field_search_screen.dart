import 'package:flutter/material.dart';
import 'package:flutter_shop_app/model/products_data.dart';

import '../../networking/products_api.dart';
import 'brand_grid_widget_search_screen.dart';
import 'consumer_tab_bar_search_screen.dart';
import 'container_of_products_for_consumer_search_screen.dart';

class TextFieldSearchScreen extends StatefulWidget {
  const TextFieldSearchScreen({super.key});

  @override
  State<TextFieldSearchScreen> createState() => _TextFieldSearchScreenState();
}

class _TextFieldSearchScreenState extends State<TextFieldSearchScreen> {
  List<Products> _allProducts = listOfCategories;

  List<Products> foundProducts = [];

  @override
  void initState() {
    foundProducts = _allProducts;
    super.initState();
  }

  void _runFilter(String enteredString) {
    List<Products> result = [];
    if (enteredString.isEmpty) {
      result = _allProducts;
    } else {
      result = _allProducts
          .where((product) => product.typeOfProducts
              .toLowerCase()
              .contains(enteredString.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProducts = result;
    });
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Theme.of(context).inputDecorationTheme.focusColor,
                ),
                suffix: TextButton(
                  child: Text('Анулювати',style: TextStyle(color:Theme.of(context).unselectedWidgetColor,),),

                  onPressed: () {
                    _searchController.clear();
                  },
                ),
              ),
              cursorColor: Colors.grey.shade400),
          TabBarSearchScreen(foundProducts: foundProducts),
        ],
      ),
    );
  }
}

class ListTileSearchScreen extends StatelessWidget {
  ListTileSearchScreen({super.key, required this.foundProducts});

  List<Products> foundProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foundProducts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(foundProducts[index].typeOfProducts),
            );
          }),
    );
  }
}

class ConsumerChoice extends StatelessWidget {
  ConsumerChoice({super.key, required this.foundProducts});

  List<Products> foundProducts;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTileSearchScreen(
          foundProducts: foundProducts,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: BrandsGridWidgetSearchScreen(),
        ),
        const ContainerProductsListSearchScreen()
      ],
    );
  }
}
