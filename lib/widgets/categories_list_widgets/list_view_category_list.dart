import 'package:flutter/material.dart';
import 'package:flutter_shop_app/model/products_data.dart';

class ClothListView extends StatelessWidget {
  ClothListView({super.key,});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: clothesCategoryListCategoriesScreen.length,
      itemBuilder: (context, index) {
        return (TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Theme.of(context).unselectedWidgetColor),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 17, top: 17),
            child: Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                clothesCategoryListCategoriesScreen[index].typeOfProducts,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          onPressed: () {},
        ));
      },
    );
  }
}

class ShoesListView extends StatelessWidget {
  const ShoesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: shoesCategoryListCategoriesScreen.length,
      itemBuilder: (context, index) {
        return (TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Theme.of(context).unselectedWidgetColor),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 17, top: 17),
            child: Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                shoesCategoryListCategoriesScreen[index].typeOfProducts,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          onPressed: () {},
        ));
      },
    );
  }
}

class AccessoriesListView extends StatelessWidget {
  const AccessoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: accessoriesCategoryListCategoriesScreen.length,
      itemBuilder: (context, index) {
        return (TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Theme.of(context).unselectedWidgetColor),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 17, top: 17),
            child: Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                accessoriesCategoryListCategoriesScreen[index].typeOfProducts,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          onPressed: () {},
        ));
      },
    );
  }
}

class BrandsListView extends StatelessWidget {
  const BrandsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: brandsListCategoriesScreen.length,
      itemBuilder: (context, index) {
        return (TextButton(
          style: ButtonStyle(
           overlayColor: MaterialStateProperty.all(Theme.of(context).unselectedWidgetColor),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 17, top: 17),
            child: Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                brandsListCategoriesScreen[index].typeOfProducts,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          onPressed: () {},
        ));
      },
    );
  }
}