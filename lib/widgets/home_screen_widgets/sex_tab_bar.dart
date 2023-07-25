import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/screens/home_screen_directory/sex_home_screen.dart';

import '../../state_management/bloc_tab_bar/bloc_tab_bar.dart';



class SexTabBar extends StatelessWidget {
  const SexTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
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
                        TabBarSexChange(tabIndex: tabIndex),
                      );
                },
              ),
            ),
            SizedBox(
              height: 700,
              child: TabBarView(
                children: [
                  SexHomeScreen(firstImage: 'lib/images/woman.jpeg'),
                  SexHomeScreen(firstImage: 'lib/images/first.jpeg'),
                  SexHomeScreen(firstImage: 'lib/images/child.jpeg'),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

List<Widget> _tabs = const [
  Tab(text: 'Вона'),
  Tab(text: 'Він'),
  Tab(text: 'Діти'),
];
