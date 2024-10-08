part of 'get_all_products_cubit.dart';

abstract class GetAllProductsState {
 
}

 class GetAllProductsInitial extends GetAllProductsState {}
 class GetAllProductsLoading extends GetAllProductsState {}
 class GetAllProductsSuccess extends GetAllProductsState {
  final List<ProductEntity> products;

  GetAllProductsSuccess({required this.products});
 }
 class GetAllProductsFailure extends GetAllProductsState {
  final String errorMsg;

  GetAllProductsFailure({required this.errorMsg});
 }
