import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/core/functions/show_snack_bar.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_product_data.dart';
import 'package:store_app/features/home/presentation/views/widgets/sliver_custom_button.dart';

class ProductInfoViewBody extends StatelessWidget {
  const ProductInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProductEntity product = GoRouterState.of(context).extra as ProductEntity;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomProductData(
            product: product,
          ),
        )),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 20,
        )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return (product.isAddedToCart == true)
                ? SliverCustomButton(
                    onTap: () {
                      BlocProvider.of<CartCubit>(context)
                          .removeCartProduct(product: product);
                      BlocProvider.of<CartCubit>(context).checkCartEmpty();
                      showSnackBar(context, 'Product removed from cart!');
                      product.isAddedToCart = false;
                    },
                    text: 'Remove from cart',
                    textColor: Colors.white,
                    boxColor: Colors.black,
                  )
                : SliverCustomButton(
                    onTap: () {
                      BlocProvider.of<CartCubit>(context)
                          .addCartProduct(product: product);
                      showSnackBar(context, 'Product added to cart!');
                      product.isAddedToCart = true;
                    },
                    text: 'Add to cart',
                    textColor: Colors.black,
                    boxColor: kPrimaryColor,
                  );
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
      ],
    );
  }
}
