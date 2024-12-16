import '../../features/home/domain/entities/product_entity.dart';

List<ProductEntity> categorizeProducts(
    List<ProductEntity> products, String category) {
  List<ProductEntity> data = [];
  for (var product in products) {
    if (product.category == category) {
      data.add(product);
    } else {
      continue;
    }
  }
  return data;
}
