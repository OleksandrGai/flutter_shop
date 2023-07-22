import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/children_home_screen.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/man_home_screen.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/woman_home_screen.dart';

// class SexToggleButtons extends StatefulWidget {
//   const SexToggleButtons({super.key});
//
//   @override
//   State<SexToggleButtons> createState() => _SexToggleButtonsState();
// }
//
// class _SexToggleButtonsState extends State<SexToggleButtons> {
//   List<bool> _isSelected = [true, false, false];
//
//   void _sexSwitch(int newIndex) {
//     setState(() {
//       for (var index = 0; index < _isSelected.length; index++) {
//         if (index == newIndex) {
//           _isSelected[index] = true;
//         } else {
//           _isSelected[index] = false;
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ToggleButtons(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: 40.0, right: 50.0),
//           child: Text('Вона'),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 50.0, right: 50.0),
//           child: Text('Він'),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 50.0, right: 40.0),
//           child: Text('Діти'),
//         ),
//       ],
//       splashColor: Colors.transparent,
//       selectedColor: Theme.of(context).focusColor,
//       color: Theme.of(context).disabledColor,
//       renderBorder: false,
//       fillColor: Colors.transparent,
//       isSelected: _isSelected,
//       onPressed: _sexSwitch,
//     );
//   }
// }

class SexTabBar extends StatefulWidget {
  SexTabBar({super.key});

  @override
  State<SexTabBar> createState() => _SexTabBarState();
}

class _SexTabBarState extends State<SexTabBar> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  void _tabChanged(int tabIndex) {
    _selectedIndex = tabIndex;
  }

  Widget _showSelectedWidget() {
    var _selectedWidget;
    switch (_selectedIndex) {
      case 0:
        _selectedWidget = WomenHomeScreen();
        break;
      case 1:
        _selectedWidget = ManHomeScreen();
        break;
      case 2:
        _selectedWidget = ChildrenHomeScreen();
        break;
    }
    return _selectedWidget;
  }
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TabBar(
          dividerColor: Theme.of(context).unselectedWidgetColor,
          labelColor: Theme.of(context).primaryColor,
          tabs: _tabs,
          controller: _tabController,
          indicatorColor: Theme.of(context).unselectedWidgetColor,
          onTap: _tabChanged,
        ),
        _showSelectedWidget(),
      ],
    );
  }
}

List<Widget> _tabs = [
  Tab(text: 'Вона'),
  Tab(text: 'Він'),
  Tab(text: 'Діти'),
];
