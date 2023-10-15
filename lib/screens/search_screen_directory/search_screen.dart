import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/networking/products_api.dart';
import 'package:flutter_shop_app/widgets/search_screen_widgets/products_bloc.dart';
import '../../widgets/search_screen_widgets/text_field_search_screen.dart';

const tabs = [
  Tab(text: 'Вона'),
  Tab(text: 'Він'),
];

class SearchScreen extends StatelessWidget {
  static const String routeName = '/searchScreen';

  SearchScreen({super.key});

  final _api = ProductsApi();
  final _searchNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: TextField(
                      onChanged: (value) {
                        _searchNotifier.value = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color:
                              Theme.of(context).inputDecorationTheme.focusColor,
                        ),
                        suffix: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Анулювати',
                            style: TextStyle(
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                          ),
                        ),
                      ),
                      cursorColor: Colors.grey.shade400),
                ),
                TabBar(
                  dividerColor: Theme.of(context).unselectedWidgetColor,
                  labelColor: Theme.of(context).primaryColor,
                  tabs: tabs,
                  indicatorColor: Theme.of(context).unselectedWidgetColor,
                  onTap: (int tabIndex) {},
                ),
                SizedBox(
                  height: 650,
                  child: Builder(builder: (context) {
                    return TabBarView(
                      children: [
                        BlocProvider(
                          create: (_) => ManProductsBloc(_api, _searchNotifier),
                          child: const ProductGrid(),
                        ),
                        BlocProvider(
                          create: (_) => WomanProductsBloc(_api, _searchNotifier),
                          child: const ProductGrid(),
                        )
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
