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
      }
      if (event is ManTabBarEvent) {
        result = await _api.fetchManProducts();
      }
      if (event is FilterEvent) {
        if (event.enteredString.isEmpty) {
        result = await _api.fetchAllProducts();
        print(result);
        } else {
          result = state.categoryProducts
              .where((product) => product.title
                  .toLowerCase()
                  .contains(event.enteredString.toLowerCase()))
              .toList();
        //  print(result);
        }
      }
      assert(result != null, "Unexpected TabBarEvent");
      emit(TabBarState(categoryProducts: result!));
    });
    add(WomanTabBarEvent());
  }
}

// class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
//   final ProductsApi _api;
//
//   TabBarBloc(this._api) : super(TabBarState(categoryProducts: [])) {
//     on<TabBarEvent>((event, emit) async {
//       List<Product>? result;
//       if (event is WomanTabBarEvent) {
//         result = await _api.fetchWomanProducts();
//       }
//       if (event is ManTabBarEvent) {
//         result = await _api.fetchManProducts();
//       }
//       assert(result != null, "Unexpected TabBarEvent");
//       emit(TabBarState(categoryProducts: result!));
//     });
//     on<FilterEvent>((event, emit) async {
//       List<Product>? result;
//       if (event.enteredString.isEmpty) {
//         result = await _api.fetchSearchProduct(state.categoryProducts);
//         print(result);
//       } else {
//         result = state.categoryProducts
//             .where((product) => product.title
//                 .toLowerCase()
//                 .contains(event.enteredString.toLowerCase()))
//             .toList();
//       }
//       emit(TabBarState(categoryProducts: result));
//     });
//     add(WomanTabBarEvent());
//   }
// }
