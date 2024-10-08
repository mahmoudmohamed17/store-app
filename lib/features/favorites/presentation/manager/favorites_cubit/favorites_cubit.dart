import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
   List<ProductEntity> products = [];
   bool isSelected = false;
  void addProduct({required ProductEntity product}) {
    products.add(product);
    isSelected = true;
    emit(FavoritesAdded());
  }
  void removeProduct({required ProductEntity product}) {
    products.removeAt(products.indexOf(product));
    isSelected = false;
    emit(FavoritesRemoved());
  }
  void checkListEmpty() {
    if(products.isEmpty) {
      emit(FavoritesEmpty());
    }
  }
}
