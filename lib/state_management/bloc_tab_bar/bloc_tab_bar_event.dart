part of 'bloc_tab_bar.dart';

class TabBarEvent {}

class TabBarSexChange extends TabBarEvent {
  TabBarSexChange({required this.tabIndex});

  final int tabIndex;
}
