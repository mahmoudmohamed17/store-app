import 'package:flutter/material.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'checkout_widget.dart';
import 'product_cart_item_list_view.dart';

class CartProductsWidget extends StatelessWidget {
  const CartProductsWidget({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(child: ProductCartItemListView(products: products,)),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: CheckoutWidget(),
        )
      ],
    );
  }
}
