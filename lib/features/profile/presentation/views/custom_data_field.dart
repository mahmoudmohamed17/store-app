import 'package:flutter/material.dart';
import 'package:store_app/core/utilities/app_styles.dart';

class CutsomDataField extends StatelessWidget {
  const CutsomDataField({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 350,
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 32,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: AppStyles.semiBold16.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
