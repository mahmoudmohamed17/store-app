import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/core/utilities/app_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyles.semiBold20,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kFavoritesView);
          },
          child: const Icon(
            FontAwesomeIcons.heart,
            size: 28,
          ),
        )
      ],
    );
  }
}
