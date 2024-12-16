import 'package:flutter/material.dart';
import '../../../../../core/utilities/app_styles.dart';
import '../../../../../core/utilities/assets_data.dart';

class EmptyFavoritesBody extends StatefulWidget {
  const EmptyFavoritesBody({
    super.key,
  });

  @override
  State<EmptyFavoritesBody> createState() => _EmptyFavoritesBodyState();
}

class _EmptyFavoritesBodyState extends State<EmptyFavoritesBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Image(
              height: 150,
              width: 150,
              image: AssetImage(AssetsData.sadHeartFace)),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 100,
            width: 270,
            child: Text(
              textAlign: TextAlign.center,
              'There\'s no favorite products in your list!',
              style: AppStyles.medium24,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
