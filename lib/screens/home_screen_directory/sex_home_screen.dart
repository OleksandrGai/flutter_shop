import 'package:flutter/material.dart';

import '../../widgets/home_screen_widgets/brands_grid_widget.dart';
import '../../widgets/home_screen_widgets/container_of_products_for_sex.dart';

class SexHomeScreen extends StatelessWidget {
  String firstImage;

  SexHomeScreen({super.key, required this.firstImage});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 14, right: 14),
        child: Column(
          children: [
            Image.asset(firstImage),
            const SizedBox(
              height: 20,
            ),
            Image.asset('lib/images/second.jpeg'),
            const SizedBox(
              height: 20,
            ),
            const ContainerProductsList(),
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
            Image.asset('lib/images/third.jpeg'),
            const SizedBox(
              height: 20,
            ),
            Image.asset('lib/images/fourth.jpeg'),
          ],
        ),
      ),
    );
  }
}
