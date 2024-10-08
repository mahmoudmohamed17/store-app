part of 'get_specific_category_cubit.dart';

abstract class GetSpecificCategoryState{
  
}

 class GetSpecificCategoryInitial extends GetSpecificCategoryState {}
 class GetSpecificCategorySuccess extends GetSpecificCategoryState {
  final List<ProductEntity> products;
  final String categoryName;
  GetSpecificCategorySuccess({required this.products, required this.categoryName});
 }
