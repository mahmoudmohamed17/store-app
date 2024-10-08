import 'package:flutter/material.dart';

import '../../styles/styles.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2000),
      content: Text(
        message,
        style: Styles.textStyle16,
      )));
}
