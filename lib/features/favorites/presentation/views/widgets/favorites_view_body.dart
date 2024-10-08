import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/features/favorites/presentation/views/widgets/empty_favorites_body.dart';
import 'package:store_app/features/favorites/presentation/views/widgets/favorite_product_item_list_view.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
      if (state is FavoritesAdded) {
        List<ProductEntity> products =
            BlocProvider.of<FavoritesCubit>(context).products;
        return FavoriteProductItemListView(
          products: products,
        );
      } else if (state is FavoritesRemoved) {
        List<ProductEntity> products =
            BlocProvider.of<FavoritesCubit>(context).products;
        return FavoriteProductItemListView(
          products: products,
        );
      } else {
        return const EmptyFavoritesBody();
      }
    });
  }
}
