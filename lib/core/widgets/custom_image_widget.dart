import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 87,
      backgroundColor: Colors.black,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image(height: 172, width: 172, image: AssetImage(image))),
    );
  }
}
