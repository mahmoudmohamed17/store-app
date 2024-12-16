import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/core/utilities/app_router.dart';
import 'package:store_app/core/utilities/assets_data.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_image_widget.dart';
import 'package:store_app/core/widgets/custom_text_field.dart';
import 'package:store_app/features/auth/data/models/user_info_model.dart';
import 'package:store_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import '../../../../../core/functions/setup_service_locator.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../domain/auth_repo.dart';

UserInfoModel? userInfoModel;

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.kMainView);
          showSnackBar(context, state.message);
          formKey.currentState!.reset();
        } else if (state is LoginFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomImageWidget(image: AssetsData.logo),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Sign in',
                  style: AppStyles.medium24,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextFormField(
                  onFieldSubmitted: (value) {
                    email = value;
                  },
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onFieldSubmitted: (value) {
                    password = value;
                  },
                  hintText: 'Password',
                  icon: Icons.visibility,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                  text: 'Sign in',
                  textColor: Colors.white,
                  color: Colors.black,
                  height: 50,
                  width: 150,
                  borderRadiusGeometry: BorderRadius.circular(35),
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .login(email: email!, password: password!);
                      formKey.currentState!.save();
                      var access = getIt.get<AuthRepo>();
                      userInfoModel = access.getUserData(email: email!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an accouunt?   ',
                      style: AppStyles.semiBold16,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                        formKey.currentState!.reset();
                      },
                      child: Text(
                        'Register',
                        style: AppStyles.semiBold16.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.2,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
