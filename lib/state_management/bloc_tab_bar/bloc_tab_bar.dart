import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/model/products_data.dart';
import 'package:flutter_shop_app/networking/products_api.dart';

part 'bloc_tab_bar_event.dart';

part 'bloc_tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  final ProductsApi _api;

  TabBarBloc(this._api) : super(TabBarState(categoryProducts: [])) {
    on<TabBarEvent>((event, emit) async {
      List<Product>? result;
      if (event is WomanTabBarEvent) {
        result = await _api.fetchWomanProducts();
      } else if (event is ManTabBarEvent) {
        result = await _api.fetchManProducts();
      }
      assert(result != null, "Unexpected TabBarEvent");
      emit(TabBarState(categoryProducts: result!));
    });
    add(WomanTabBarEvent());
  }
}
