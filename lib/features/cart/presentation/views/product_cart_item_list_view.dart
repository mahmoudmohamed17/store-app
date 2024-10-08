import 'package:flutter/material.dart';
import 'package:store_app/features/cart/presentation/views/product_cart_item.dart';

import '../../../home/domain/entities/product_entity.dart';

class ProductCartItemListView extends StatelessWidget {
  const ProductCartItemListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ProductCartItem(product: products[index],),
          );
        });
  }
}
