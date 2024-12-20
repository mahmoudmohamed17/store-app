import 'package:flutter/material.dart';
import 'package:store_app/core/utilities/app_styles.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2000),
      content: Text(
        message,
        style: AppStyles.semiBold16,
      )));
}
