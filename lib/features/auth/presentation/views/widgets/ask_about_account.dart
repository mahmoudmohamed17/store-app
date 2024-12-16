import 'package:flutter/material.dart';
import 'package:store_app/core/utilities/app_styles.dart';

class AskAboutAccount extends StatelessWidget {
  const AskAboutAccount({
    super.key,
    required this.onTap,
    required this.title,
    required this.action,
  });

  final VoidCallback onTap;
  final String title, action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.semiBold16,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: AppStyles.semiBold16.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 2.2,
            ),
          ),
        )
      ],
    );
  }
}
