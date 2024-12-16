import 'package:flutter/material.dart';
import 'package:store_app/core/utilities/app_styles.dart';

class SampleSquareCard extends StatelessWidget {
  const SampleSquareCard(
      {super.key,
      required this.text,
      this.onTap,
      this.color = Colors.white,
      this.borderRadiusGeometry = BorderRadius.zero});
  final String text;
  final void Function()? onTap;
  final Color color;
  final BorderRadiusGeometry borderRadiusGeometry;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: 32,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: borderRadiusGeometry),
          color: color,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: AppStyles.medium14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
