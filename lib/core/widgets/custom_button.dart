import 'package:flutter/material.dart';
import 'package:store_app/core/utilities/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.borderRadiusGeometry = BorderRadius.zero,
      this.color = Colors.white,
      required this.textColor,
      required this.height,
      required this.width,
      this.fontWeight});
  final String text;
  final Function()? onTap;
  final BorderRadiusGeometry borderRadiusGeometry;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyles.semiBold20.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
