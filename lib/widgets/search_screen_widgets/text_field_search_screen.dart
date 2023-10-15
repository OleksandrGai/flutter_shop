import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/model/products_data.dart';
import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';
import '../home_screen_widgets/products_details.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: product.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProductsDetails.routeName,
                        arguments: Product(
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
                      width: double.infinity,
                      height: 145,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    product[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}