import 'package:flutter/material.dart';
import 'package:store_app/core/styles/styles.dart';

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
      child: Card(
        color: color,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: borderRadiusGeometry),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(
            text,
            style: Styles.textStyle20.copyWith(
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
