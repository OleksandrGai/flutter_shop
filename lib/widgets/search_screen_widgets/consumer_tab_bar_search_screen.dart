import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/networking/products_api.dart';
import 'package:flutter_shop_app/widgets/search_screen_widgets/text_field_search_screen.dart';

import '../../model/products_data.dart';
import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';

class TabBarSearchScreen extends StatelessWidget {
  TabBarSearchScreen({super.key, required this.foundProducts});

  List<Products> foundProducts;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (_) => TabBarBloc(),
      child: BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
        return DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: TabBar(
                  dividerColor: Theme.of(context).unselectedWidgetColor,
                  labelColor: Theme.of(context).primaryColor,
                  tabs: _tabs,
                  indicatorColor: Theme.of(context).unselectedWidgetColor,
                  onTap: (int tabIndex) {
                    context.read<TabBarBloc>().add(
                          WomanTabBarEvent(),
                        );
                  },
                ),
              ),
              SizedBox(
                height: 650,
                child: TabBarView(
                  children: [
                    ConsumerChoice(foundProducts: foundProducts),
                    ConsumerChoice(foundProducts: foundProducts),
                    ConsumerChoice(foundProducts: foundProducts),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

List<Widget> _tabs = const [
  Tab(text: 'Вона'),
  Tab(text: 'Він'),
  Tab(text: 'Діти'),
];
