import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/presentation/views/widgets/rating_widget.dart';


class FavoriteProductItem extends StatelessWidget {
  const FavoriteProductItem({super.key, required this.product});
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
          const SizedBox(width: 5,),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CachedNetworkImage(
                alignment: Alignment.center,
                height: 140,
                width: 140,
                fit: BoxFit.fill,
                imageUrl: product.image!,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 150,
                    height: 105,
                    child: Text(
                      textAlign: TextAlign.left,
                      product.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: AppStyles.semiBold16,
                    )),
                Text(
                  r'$''${product.price}',
                  style: AppStyles.semiBold16,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      product.isSelected = false;
                      BlocProvider.of<FavoritesCubit>(context)
                          .removeProduct(product: product);
                      BlocProvider.of<FavoritesCubit>(context).checkListEmpty();
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 32,
                    )),
                const SizedBox(
                  height: 55,
                ),
                RatingWidget(rate: product.rate ?? 0.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
