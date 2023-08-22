import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/model/products_data.dart';
import 'package:flutter_shop_app/networking/products_api.dart';

part 'bloc_tab_bar_event.dart';

part 'bloc_tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarState(categoryProducts: [])) {
    on<TabBarEvent>((event, emit) async {

      if (event is WomanTabBarEvent) {
        final List<Products1> womanResult = await fetchWomanProducts();
        emit(TabBarState( categoryProducts: womanResult));
      }
      if (event is ManTabBarEvent) {
        final List<Products1> manResult = await fetchManProducts();
        emit(TabBarState( categoryProducts: manResult));
      }
    });
    add(WomanTabBarEvent());
  }
}
