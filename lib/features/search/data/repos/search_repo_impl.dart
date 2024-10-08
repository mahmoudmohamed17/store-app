import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/search/data/data_sources/search_local_data_source.dart';
import 'package:store_app/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchLocalDataSource _searchLocalDataSource;
  SearchRepoImpl(this._searchLocalDataSource);
  @override
  List<ProductEntity> getSpecificCategory({required String category}) {
    List<ProductEntity> products =
        _searchLocalDataSource.getSpecificCategory(cetegory: category);
    return products;
  }
}
