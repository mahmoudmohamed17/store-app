import 'package:store_app/features/home/domain/entities/product_entity.dart';

import 'rating.dart';

class ProductModel extends ProductEntity {
  final int? id;
  // ignore: annotate_overrides, overridden_fields
  final String? title;
  // ignore: annotate_overrides, overridden_fields
  final num? price;
  // ignore: annotate_overrides, overridden_fields
  final String? description;
  // ignore: annotate_overrides, overridden_fields
  final String? category;
  // ignore: annotate_overrides, overridden_fields
  final String? image;
  final Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  }) : super(
            title: title,
            image: image,
            rate: rating!.rate,
            price: price,
            description: description,
            category: category,
            isSelected: false,
            size: 'S',
            isAddedToCart: false);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: json['price'],
        description: json['description'] as String?,
        category: json['category'] as String?,
        image: json['image'] as String?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson(),
      };
}
