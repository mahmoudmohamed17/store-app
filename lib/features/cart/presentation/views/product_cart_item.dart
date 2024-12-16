import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/cart/presentation/views/add_product_counter_widget.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                height: 120,
                width: 140,
                fit: BoxFit.cover,
                imageUrl: product.image!,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 32,
                  color: Colors.red,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        textAlign: TextAlign.left,
                        product.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: AppStyles.semiBold16,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    r'$' '${product.price}',
                    style:
                        AppStyles.medium14.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .removeCartProduct(product: product);
                      product.isAddedToCart = false;
                      BlocProvider.of<CartCubit>(context).checkCartEmpty();
                    },
                    icon: const Icon(Icons.delete)),
                const SizedBox(
                  height: 40,
                ),
                AddProductCounterWidget(
                  product: product,
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
