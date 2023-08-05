import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/customer_home_screen.dart';

import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';

class ConsumerTabBar extends StatelessWidget {
  const ConsumerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (_) => TabBarBloc(),
      child: BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
        return DefaultTabController(
          length: 3,
          initialIndex: state.index,
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
                          ConsumerTabBarEvent(tabIndex: tabIndex),
                        );
                  },
                ),
              ),
              const SizedBox(
                height: 700,
                child: TabBarView(
                  children: [
                    CustomerHomeScreen(firstImage: 'lib/images/woman.jpeg'),
                    CustomerHomeScreen(firstImage: 'lib/images/first.jpeg'),
                    CustomerHomeScreen(firstImage: 'lib/images/child.jpeg'),
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
