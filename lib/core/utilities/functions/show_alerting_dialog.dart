import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/styles/styles.dart';
import 'package:store_app/core/utilities/app_router.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/main_view.dart';

void showAlertingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          title: const Text(
            'Are you really want to leave?',
            style: Styles.textStyle20,
          ),
          actions: [
            CustomButton(
              text: 'Yes',
              textColor: Colors.white,
              color: Colors.red,
              height: 40,
              width: 100,
              borderRadiusGeometry: BorderRadius.circular(25),
              onTap: () {
                GoRouter.of(context).go(AppRouter.kLoginView);
                activeIndex = 0;
              },
            ),
            CustomButton(
              text: 'No',
              textColor: Colors.white,
              color: Colors.green,
              height: 40,
              width: 100,
              borderRadiusGeometry: BorderRadius.circular(25),
              onTap: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        );
      });
}
