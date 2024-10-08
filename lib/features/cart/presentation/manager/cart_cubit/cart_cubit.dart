import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductEntity> products = [];
  double totalPrice = 0.0;
  void addCartProduct({required ProductEntity product}) {
    products.add(product);
    emit(CartAdded());
  }

  void removeCartProduct({required ProductEntity product}) {
    products.removeAt(products.indexOf(product));
    totalPrice = totalPrice - (product.price! * product.productCount);
    emit(CartRemoved());
  }

  void checkCartEmpty() {
    if (products.isEmpty) {
      totalPrice = 0.0;
      emit(CartEmpty());
    }
  }

  void incrementProduct({required ProductEntity product}) {
    product.productCount = product.productCount + 1;
    totalPrice = totalPrice + product.price!;
    emit(CartProductIncrement());
  }

  void decrementProduct({required ProductEntity product}) {
    if (product.productCount > 0) {
      product.productCount = product.productCount - 1;
      totalPrice = totalPrice - product.price!;

      emit(CartProductDecrement());
    } else {}
  }
}
