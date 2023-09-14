import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/home_screen_widgets/products_details.dart';

import '../../model/products_data.dart';
import '../../state_management/product_inherit/product_inherited_widget.dart';

class ContainerProductsList extends StatelessWidget {
  const ContainerProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = context
        .dependOnInheritedWidgetOfExactType<ProductInherit>()
        ?.productsCategory;
    return SizedBox(
      height: 200,
      width: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product!.length ~/ 3,
        itemBuilder: (context, index) {
          return Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 14),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductsDetails.routeName,
                          arguments: Products1(
                            id: product[index].id,
                            description: product[index].description,
                            image: product[index].image,
                            title: product[index].title,
                            price: '${product[index].price.toString()}\$',
                          ),
                        );
                      },
                      child: Image.network(
                        product[index].image,
                        height: 140,
                        width: 130,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 115,
                        child: Text(
                          maxLines: 10,
                          product[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Text(
                      '${product[index].price.toString()}\$',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
              ),
            ],
          );
        },
      ),
    );
  }
}
