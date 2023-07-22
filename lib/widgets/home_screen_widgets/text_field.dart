import 'package:flutter/material.dart';
import '../../model/test_data.dart';
import '../../networking/products_api.dart';
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
      final productTitle = product.type.toLowerCase();
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
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: updateList,
          decoration:  InputDecoration(
              prefixIcon: Icon(Icons.search_outlined,color: Theme.of(context).inputDecorationTheme.focusColor,),
              suffixIcon: Icon(Icons.camera_alt_outlined,color: Theme.of(context).inputDecorationTheme.focusColor),),
       cursorColor: Colors.grey.shade400 ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
