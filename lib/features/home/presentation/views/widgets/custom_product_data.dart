import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

import '../../../../../core/utilities/app_styles.dart';

class CustomProductData extends StatelessWidget {
  const CustomProductData({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: CachedNetworkImage(
            imageUrl: product.image ?? '',
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 45,
            ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 285,
              child: Text(
                product.title ?? '',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.semiBold20,
              ),
            ),
            Text(
             r'$''${product.price}',
              style: AppStyles.semiBold16,
            )
          ],
        ),
        const SizedBox(height: 25,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product.description ?? '',
            style: AppStyles.semiBold16.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
