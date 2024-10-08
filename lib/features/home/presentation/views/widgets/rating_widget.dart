import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rate});
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rate.toString(),
          style: Styles.textStyle14,
        ),
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 24,
        )
      ],
    );
  }
}
