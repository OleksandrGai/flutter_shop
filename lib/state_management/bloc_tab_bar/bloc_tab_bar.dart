import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_tab_bar_event.dart';

part 'bloc_tab_bar_state.dart';

class TabBarBloc extends Bloc<ConsumerTabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarState(index: 0)) {
    on<ConsumerTabBarEvent>((event, emit) {
      if (event is ConsumerTabBarEvent) {
        emit(TabBarState(index: event.tabIndex));
      }
    });
  }
}
