import 'package:flutter/material.dart';

/*
class HomeTextFieldWidget extends StatefulWidget {
  const HomeTextFieldWidget({super.key});

  @override
  State<HomeTextFieldWidget> createState() => _HomeTextFieldWidgetState();
}

List<TestProducts> allProducts = listOfCategories;
final _controller = TextEditingController();

class _HomeTextFieldWidgetState extends State<HomeTextFieldWidget> {
  void updateList(String value) {
    final suggestion = allProducts.where((product) {
      final productTitle = product.typeOfProducts.toLowerCase();
      final input = value.toLowerCase();
      return productTitle.contains(input);
    }).toList();
    setState(() => allProducts = suggestion);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late List<TestProducts> displayList = List.from(listOfCategories);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: updateList,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Theme.of(context).inputDecorationTheme.focusColor,
          ),
          suffixIcon: Icon(Icons.camera_alt_outlined,
              color: Theme.of(context).inputDecorationTheme.focusColor),
        ),
        cursorColor: Colors.grey.shade400);
  }
}
 */
class HomeTextFieldWidget extends StatelessWidget {
  const HomeTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void navigationToSearchScreen() {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/searchScreen', (route) => false);
    }

    return TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Theme.of(context).inputDecorationTheme.focusColor,
          ),
          suffixIcon: Icon(Icons.camera_alt_outlined,
              color: Theme.of(context).inputDecorationTheme.focusColor),
        ),
        cursorColor: Colors.grey.shade400);
  }
}
