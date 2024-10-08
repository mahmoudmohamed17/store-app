import 'package:store_app/core/utilities/functions/save_category_box_data.dart';
import 'package:store_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

abstract class SearchLocalDataSource {
  List<ProductEntity> getSpecificCategory({required String cetegory});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  final HomeLocalDataSource _homeLocalDataSource; // reuse the home local data source
  SearchLocalDataSourceImpl(this._homeLocalDataSource);
  @override
  List<ProductEntity> getSpecificCategory({required String cetegory}) {
    List<ProductEntity> products =
        categorizeProducts(_homeLocalDataSource.getAllProducts(), cetegory);
    return products;
  }
}
