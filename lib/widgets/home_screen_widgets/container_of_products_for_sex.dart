import 'package:flutter/material.dart';
import 'package:flutter_shop_app/model/products_data.dart';

class ContainerProductsList extends StatelessWidget {
  const ContainerProductsList({
    super.key,
    required this.productsCategory,
  });

  final List<Products1> productsCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsCategory.length ~/3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(
                productsCategory[index].image,
                height: 120,
                width: 120,
                fit: BoxFit.fill,
              ),
              Flexible(
                child: SizedBox(
                  width: 115,
                  child: Text(
                    maxLines: 10,
                    productsCategory[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Text(
                '${productsCategory![index].price.toString()}\$',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
