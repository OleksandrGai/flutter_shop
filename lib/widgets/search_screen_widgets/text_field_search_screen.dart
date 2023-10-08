import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/model/products_data.dart';
import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';
import '../home_screen_widgets/products_details.dart';
// TODO: TextFieldSearchScreen with StatefulWidget
// /*
// class TextFieldSearchScreen extends StatefulWidget {
//   const TextFieldSearchScreen({super.key});
//
//   @override
//   State<TextFieldSearchScreen> createState() => _TextFieldSearchScreenState();
// }
//
// class _TextFieldSearchScreenState extends State<TextFieldSearchScreen> {
//   final ProductsApi _api = ProductsApi();
//   List<Product> _allProducts = [];
//
//   List<Product> foundProducts = [];
//
//   @override
//   void initState() {
//     _api.fetchAllProducts().then((products) {
//       _allProducts.addAll(products);
//       foundProducts = _allProducts;
//     });
//     super.initState();
//   }
//
//   void _runFilter(String enteredString) {
//     List<Product> result = [];
//     if (enteredString.isEmpty) {
//       result = _allProducts;
//     } else {
//       result = _allProducts
//           .where((product) =>
//               product.title.toLowerCase().contains(enteredString.toLowerCase()))
//           .toList();
//     }
//     setState(() {
//       foundProducts = result;
//     });
//   }
//
//   // @override
//   // void dispose() {
//   //   _searchController.dispose();
//   //   super.dispose();
//   // }
//
//   // final TextEditingController _searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 14, right: 14),
//       child: BlocProvider<TabBarBloc>(
//         create: (_) => TabBarBloc(ProductsApi()),
//         child: BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
//           return Column(children: [
//             TextField(
//                 // controller: _searchController,
//                 onChanged: (value) => _runFilter(value),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(
//                     Icons.search_outlined,
//                     color: Theme.of(context).inputDecorationTheme.focusColor,
//                   ),
//                   suffix: TextButton(
//                     child: Text(
//                       'Анулювати',
//                       style: TextStyle(
//                         color: Theme.of(context).unselectedWidgetColor,
//                       ),
//                     ),
//                     onPressed: () {
//                       //   _searchController.clear();
//                     },
//                   ),
//                 ),
//                 cursorColor: Colors.grey.shade400),
//             DefaultTabController(
//               length: 2,
//               initialIndex: 0,
//               child: Column(
//                 children: [
//                   TabBar(
//                     dividerColor: Theme.of(context).unselectedWidgetColor,
//                     labelColor: Theme.of(context).primaryColor,
//                     tabs: _tabs,
//                     indicatorColor: Theme.of(context).unselectedWidgetColor,
//                     onTap: (int tabIndex) {
//                       if (tabIndex == 0) {
//                         context.read<TabBarBloc>().add(
//                               WomanTabBarEvent(),
//                             );
//                       }
//                       if (tabIndex == 1) {
//                         context.read<TabBarBloc>().add(
//                               ManTabBarEvent(),
//                             );
//                       }
//                     },
//                   ),
//                   SizedBox(
//                     height: 700,
//                     child: TabBarView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       children: [
//                         ProductGrid(
//                             product: foundProducts
//                                 .where((element) =>
//                                     element.category == "women's clothing")
//                                 .toList()),
//                         ProductGrid(
//                             product: foundProducts
//                                 .where((element) =>
//                                     element.category == "men's clothing")
//                                 .toList()),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//         }),
//       ),
//     );
//   }
// }
//
// List<Widget> _tabs = const [
//   Tab(text: 'Вона'),
//   Tab(text: 'Він'),
// ];
//
class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.product,
  });

  final List<Product> product;

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