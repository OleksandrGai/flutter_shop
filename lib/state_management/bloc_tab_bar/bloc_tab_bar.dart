import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_tab_bar_event.dart';

part 'bloc_tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitialState(index: 0)) {
    on<TabBarEvent>((event, emit) {
      if (event is TabBarSexChange) {
        emit(TabBarSexState(index: event.tabIndex));
      }
    });
  }
}
