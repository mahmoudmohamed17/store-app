import 'package:flutter/material.dart';
import 'package:store_app/features/favorites/presentation/views/widgets/favorite_product_item.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class FavoriteProductItemListView extends StatelessWidget {
  const FavoriteProductItemListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: FavoriteProductItem(product: products[index],),
        );
      },
    );
  }
}
