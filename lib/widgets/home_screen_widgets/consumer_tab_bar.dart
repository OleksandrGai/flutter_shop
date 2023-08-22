import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/customer_home_screen.dart';

import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';

class ConsumerTabBar extends StatelessWidget {
  const ConsumerTabBar({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (_) => TabBarBloc(),
      child: BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
        return DefaultTabController(
          length: 2,
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
                    if (tabIndex == 0) {
                      context.read<TabBarBloc>().add(
                            WomanTabBarEvent(),
                          );
                    }
                    if (tabIndex == 1) {
                      context.read<TabBarBloc>().add(
                            ManTabBarEvent(),
                          );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 700,
                child: TabBarView(
                  children: [
                    CustomerHomeScreen(
                      firstImage: 'lib/images/woman.jpeg',
                      secondImage: 'lib/images/second.jpeg',
                      thirdImage: 'lib/images/third.jpeg',
                      fourthImage: 'lib/images/fourth.jpeg',
                      productsCategory: state.categoryProducts,
                    ),
                    CustomerHomeScreen(
                      firstImage: 'lib/images/woman.jpeg',
                      secondImage: 'lib/images/second.jpeg',
                      thirdImage: 'lib/images/third.jpeg',
                      fourthImage: 'lib/images/fourth.jpeg',
                      productsCategory: state.categoryProducts,
                    ),
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
];
