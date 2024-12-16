import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/core/functions/show_snack_bar.dart';
import 'package:store_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class FavoriteBadgeWidget extends StatefulWidget {
  const FavoriteBadgeWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  State<FavoriteBadgeWidget> createState() => _FavoriteBadgeWidgetState();
}

class _FavoriteBadgeWidgetState extends State<FavoriteBadgeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.product.isSelected == true) {
          widget.product.isSelected = false;
          BlocProvider.of<FavoritesCubit>(context)
              .removeProduct(product: widget.product);
          BlocProvider.of<FavoritesCubit>(context).checkListEmpty();
          showSnackBar(context, 'Product removed from Favorites!');
        } else {
          widget.product.isSelected = true;
          BlocProvider.of<FavoritesCubit>(context)
              .addProduct(product: widget.product);
          showSnackBar(context, 'Product added to Favorites!');

        }
        setState(() {});
      },
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(55)),
        alignment: Alignment.center,
        child: Icon(
          (widget.product.isSelected == true)
              ? FontAwesomeIcons.solidHeart
              : FontAwesomeIcons.heart,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
