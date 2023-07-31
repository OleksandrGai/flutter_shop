import 'package:flutter/material.dart';

import '../../widgets/list_of_categories_widgets/list_of_categories_tab_bar.dart';

class ListOfCategoriesScreen extends StatelessWidget {
  const ListOfCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
              child: ListOfCategoriesTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
