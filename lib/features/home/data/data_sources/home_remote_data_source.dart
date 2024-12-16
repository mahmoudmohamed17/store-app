import 'package:store_app/constanst.dart';
import 'package:store_app/core/utilities/api_service.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

import '../../../../core/functions/get_products_list.dart';
import '../../../../core/functions/save_box_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getAllProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    var results = await _apiService.getAllProducts(endPoint: 'products');
    List<ProductEntity> products = getProductsList(
        results); // parsing the data to be a list of ProductEntity
    saveBoxData(
        products, kProductEntityBox); // saving the data into the local storage
    return products;
  }
}
