import 'package:hive_flutter/adapters.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final double? rate;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? category;
  @HiveField(6)
  bool? isSelected;
  @HiveField(7)
  String? size;
  @HiveField(8)
  bool? isAddedToCart;
  @HiveField(9)
  int productCount = 0;
  ProductEntity(
      {required this.title,
      required this.image,
      required this.rate,
      required this.price,
      required this.description,
      required this.category,
      required this.isSelected,
      required this.size,
      required this.isAddedToCart});
}
