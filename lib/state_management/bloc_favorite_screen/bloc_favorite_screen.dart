import 'package:bloc/bloc.dart';

import '../../model/products_data.dart';

class FavoriteScreenBloc
    extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  FavoriteScreenBloc() : super(FavoriteScreenState(favoriteList: [])) {
    on<FavoriteScreenEvent>((_eventToState));
  }

  Future<void> _eventToState(
      FavoriteScreenEvent event, Emitter<FavoriteScreenState> emit) async {
    if (event is AddProduct) {
      final updatedFavorite = List<Product>.from(state.favoriteList)..add(event.product);
      emit(FavoriteScreenState(favoriteList: updatedFavorite));
    }
    if (event is RemoveProduct) {
      final updatedFavorite = List<Product>.from(state.favoriteList)
        ..remove(event.product);
      emit(FavoriteScreenState(favoriteList: updatedFavorite));
    }
  }
}

class FavoriteScreenState {
  final List<Product> favoriteList;

  FavoriteScreenState({required this.favoriteList});
}

class FavoriteScreenEvent {}

class AddProduct extends FavoriteScreenEvent {
  final Product product;

  AddProduct({required this.product});
}

class RemoveProduct extends FavoriteScreenEvent {
  final Product product;

  RemoveProduct({required this.product});
}
