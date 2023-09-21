part of 'bloc_tab_bar.dart';

class TabBarEvent {}

class WomanTabBarEvent extends TabBarEvent {}

class ManTabBarEvent extends TabBarEvent {}

class FilterEvent extends TabBarEvent {
  FilterEvent({required this.enteredString});

  final String enteredString;
}