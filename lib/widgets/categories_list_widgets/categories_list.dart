import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/categories_list_widgets/categories_expansion_tile.dart';
import 'package:flutter_shop_app/widgets/categories_list_widgets/list_view_category_list.dart';

import '../../model/products_data.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTileCategoryListScreen(
            initiallyExpanded: false,
            categoryName:
                productsCategoryListCategoriesScreen[0].typeOfProducts,
            categoryWidget: ClothListView(),
          ),
          ExpansionTileCategoryListScreen(
            initiallyExpanded: false,
            categoryName:
                productsCategoryListCategoriesScreen[1].typeOfProducts,
            categoryWidget: ShoesListView(),
          ),
          ExpansionTileCategoryListScreen(
            initiallyExpanded: false,
            categoryName:
                productsCategoryListCategoriesScreen[2].typeOfProducts,
            categoryWidget: AccessoriesListView(),
          ),
          ExpansionTileCategoryListScreen(
            initiallyExpanded: true,
            categoryName:
            productsCategoryListCategoriesScreen[3].typeOfProducts,
            categoryWidget: BrandsListView(),
          ),
        ],
      ),
    );
  }
}
