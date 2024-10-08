import 'package:flutter/material.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1, crossAxisCount: 2, mainAxisSpacing: 7),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: products[index],
            );
          }),
    );
  }
}
