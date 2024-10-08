import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/domain/use_cases/get_all_products_use_case.dart';
part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this._getAllProductsUseCase)
      : super(GetAllProductsInitial());
  final GetAllProductsUseCase _getAllProductsUseCase;
  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());
    var result = await _getAllProductsUseCase.call();
    result.fold((failure) {
      emit(GetAllProductsFailure(errorMsg: failure.errorMsg));
    }, (products) {
      emit(GetAllProductsSuccess(products: products));
    });
  }
}
