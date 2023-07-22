import 'package:flutter/material.dart';

import '../../widgets/home_screen_widgets/brands_grid_widget.dart';
import '../../widgets/home_screen_widgets/container_of_products_for_sex.dart';

class WomenHomeScreen extends StatelessWidget {
  const WomenHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Image.asset('lib/images/woman.jpeg'),
        const SizedBox(
          height: 20,
        ),
        Image.asset('lib/images/second.jpeg'),
        const SizedBox(
          height: 20,
        ),
        ContainerProductsList(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Рекомендовані бренди',
          style:  Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        BrandsGridWidget(),
        const SizedBox(
          height: 20,
        ),
        Image.asset('lib/images/third.jpeg'),
        const SizedBox(
          height: 20,
        ),
        Image.asset('lib/images/fourth.jpeg'),
      ],
    );
  }
}
