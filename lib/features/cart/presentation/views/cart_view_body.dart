import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_app_bar.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/cart/presentation/views/empty_cart_body.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

import 'cart_products_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(text: 'Cart'),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            if (state is CartEmpty || state is CartInitial) {
              return const EmptyCartBody();
            } else {
              List<ProductEntity> products =
                  BlocProvider.of<CartCubit>(context).products;
              return Expanded(
                child: CartProductsWidget(
                  products: products,
                ),
              );
            }
          }),
          // EmptyCartBody(),
        ],
      ),
    );
  }
}
