import 'package:flutter/material.dart';

import '../../widgets/categories_list_widgets/categories_list_tab_bar.dart';



class ListOfCategoriesScreen extends StatelessWidget {
  const ListOfCategoriesScreen({super.key});
  static const String routeName = '/listScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14, right: 14),
             // child:
              //CategoriesListTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
