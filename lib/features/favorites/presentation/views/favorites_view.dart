import 'package:flutter/material.dart';
import 'package:store_app/core/styles/styles.dart';
import 'package:store_app/features/favorites/presentation/views/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              'Favorites',
              style: Styles.textStyle20,
            ),
          )
        ],
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 32),
      ),
      body: const FavoritesViewBody(),
    );
  }
}
