import 'package:flutter/material.dart';
import 'package:store_app/core/styles/styles.dart';
import 'package:store_app/core/utilities/assets_data.dart';

class EmptySearchBody extends StatelessWidget {
  const EmptySearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(height: 100, width: 100, image: AssetImage(AssetsData.search)),
        const SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.center,
          'No search feed\nHit a tab to start!',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
