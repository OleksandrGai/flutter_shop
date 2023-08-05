import 'package:flutter/material.dart';

import '../../widgets/categories_list_widgets/categories_list_tab_bar.dart';



class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: CategoriesListTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
