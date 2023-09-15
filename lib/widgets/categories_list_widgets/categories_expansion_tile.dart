import 'package:flutter/material.dart';

class ExpansionTileCategoryListScreen extends StatelessWidget {
  ExpansionTileCategoryListScreen(
      {super.key,
      required this.categoryName,
      required this.categoryWidget,
      this.initiallyExpanded});

  final String categoryName;
  final Widget categoryWidget;
  bool? initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded!,
      textColor: Theme.of(context).focusColor,
      iconColor: Theme.of(context).focusColor,
      title: Text(
        categoryName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      children: [categoryWidget],
    );
  }
}
