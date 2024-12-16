import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/core/utilities/assets_data.dart';
import 'package:store_app/core/functions/show_alerting_dialog.dart';
import 'package:store_app/core/widgets/custom_app_bar.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_image_widget.dart';
import 'package:store_app/features/auth/presentation/views/widgets/login_body.dart';
import 'package:store_app/features/profile/presentation/views/custom_data_field.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(text: 'Profile'),
          const SizedBox(
            height: 50,
          ),
          CustomImageWidget(
            image: AssetsData.profile,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userInfoModel?.firstName}' ' ${userInfoModel?.lastName}',
                style: AppStyles.semiBold20.copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          CutsomDataField(icon: Icons.email, text: userInfoModel!.email),
          CutsomDataField(icon: Icons.lock, text: userInfoModel!.password),
          const SizedBox(
            height: 45,
          ),
          CustomButton(
            text: 'Log out',
            textColor: Colors.black,
            height: 50,
            width: 200,
            color: kPrimaryColor,
            borderRadiusGeometry: BorderRadius.circular(24),
            onTap: () {
              showAlertingDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
