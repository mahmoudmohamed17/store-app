import 'package:flutter/material.dart';
import 'package:store_app/core/styles/styles.dart';
import 'package:store_app/core/utilities/assets_data.dart';

class EmptyCartBody extends StatelessWidget {
  const EmptyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100,),
        Image(
            height: 235,
            width: 235,
            image: AssetImage(AssetsData.sadShoppingCartFace)),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Your cart is empty!',
          style: Styles.textStyle24,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
