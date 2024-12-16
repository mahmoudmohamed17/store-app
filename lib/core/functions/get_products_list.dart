 import '../../features/home/data/models/product_model/product_model.dart';
import '../../features/home/domain/entities/product_entity.dart';

List<ProductEntity> getProductsList(List<dynamic> results) {
    List<ProductEntity> products = [];
    for (var result in results) {
      products.add(ProductModel.fromJson(result));
    }
    return products;
  }