import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/core/functions/show_snack_bar.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_product_data.dart';

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

class SliverCustomButton extends StatelessWidget {
  const SliverCustomButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.textColor,
      required this.boxColor});
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final Color boxColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartRemoved) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                onTap: onTap,
                fontWeight: FontWeight.w400,
                text: text,
                textColor: textColor,
                height: 55,
                width: 270,
                color: boxColor,
                borderRadiusGeometry: BorderRadius.circular(24),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                onTap: onTap,
                fontWeight: FontWeight.w400,
                text: text,
                textColor: textColor,
                height: 55,
                width: 270,
                color: boxColor,
                borderRadiusGeometry: BorderRadius.circular(24),
              ),
            ),
          );
        }
      },
    );
  }
}
