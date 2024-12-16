import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/core/utilities/app_styles.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({super.key, required this.isActive, this.onTap, required this.size});
  final bool isActive;
  final void Function()? onTap;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 55,
          width: 55,
          child: Card(
            elevation: 5,
            color: (isActive == true) ? kPrimaryColor : Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child:  Align(
              alignment: Alignment.center,
              child: Text(
               size,
                style: AppStyles.medium12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
