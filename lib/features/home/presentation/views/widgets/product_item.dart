import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/core/utilities/app_router.dart';
import 'package:store_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

import 'favorite_badge_widget.dart';
import 'rating_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kProductInfoView, extra: product);
          },
          child: Stack(
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: CachedNetworkImage(
                        width: 190,
                        height: 100,
                        fit: BoxFit.cover,
                        imageUrl: product.image ?? '',
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 85,
                              height: 60,
                              child: Text(
                                textAlign: TextAlign.left,
                                product.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppStyles.semiBold16,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                r'$' '${product.price}',
                                style: AppStyles.semiBold16,
                              ),
                              RatingWidget(
                                rate: product.rate ?? 0.0,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 142,
                  bottom: 142,
                  child: FavoriteBadgeWidget(
                    product: product,
                  ))
            ],
          ),
        );
      },
    );
  }
}
