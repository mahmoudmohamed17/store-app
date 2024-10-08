import 'package:bloc/bloc.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/search/domain/repos/search_repo.dart';
part 'get_specific_category_state.dart';

class GetSpecificCategoryCubit extends Cubit<GetSpecificCategoryState> {
  GetSpecificCategoryCubit(this._searchRepo)
      : super(GetSpecificCategoryInitial());
  final SearchRepo _searchRepo;
  getSpecificCategory({required String category}) {
    List<ProductEntity> products =
        _searchRepo.getSpecificCategory(category: category);
    emit(GetSpecificCategorySuccess(products: products, categoryName: category));
  }
}
