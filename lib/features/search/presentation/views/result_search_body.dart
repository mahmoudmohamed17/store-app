import 'package:flutter/material.dart';
import 'package:store_app/core/styles/styles.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_item.dart';

class ResultSearchBody extends StatelessWidget {
  const ResultSearchBody(
      {super.key, required this.products, required this.category});
  final List<ProductEntity> products;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          (category == 'jewelery') ? 'JEWELRY' : category.toUpperCase(),
          style: Styles.textStyle20,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1, crossAxisCount: 2, mainAxisSpacing: 7),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(product: products[index]);
              }),
        )
      ],
    );
  }
}
