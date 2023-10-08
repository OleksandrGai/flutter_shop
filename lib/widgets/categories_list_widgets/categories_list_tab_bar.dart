// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_shop_app/networking/products_api.dart';
// import 'package:flutter_shop_app/widgets/categories_list_widgets/categories_list.dart';
//
// import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';
//
// class CategoriesListTabBar extends StatelessWidget {
//   const CategoriesListTabBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<TabBarBloc>(
//       create: (_) => TabBarBloc(ProductsApi()),
//       child: BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
//         return DefaultTabController(
//           length: 3,
//           initialIndex: 0,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 14, right: 14),
//                 child: TabBar(
//                   dividerColor: Theme.of(context).unselectedWidgetColor,
//                   labelColor: Theme.of(context).primaryColor,
//                   tabs: _tabs,
//                   indicatorColor: Theme.of(context).unselectedWidgetColor,
//                   onTap: (int tabIndex) {
//                     context.read<TabBarBloc>().add(
//                           WomanTabBarEvent(),
//                         );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 700,
//                 child: TabBarView(
//                   children: [
//                     CategoriesList(),
//                     CategoriesList(),
//                     CategoriesList()
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
//
// List<Widget> _tabs = const [
//   Tab(text: 'Вона'),
//   Tab(text: 'Він'),
//   Tab(text: 'Діти'),
// ];
