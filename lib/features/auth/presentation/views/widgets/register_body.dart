import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import '../../../../../core/utilities/app_styles.dart';
import '../../../../../core/utilities/assets_data.dart';
import '../../../../../core/functions/setup_service_locator.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../domain/auth_repo.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password, firstName, lastName;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showSnackBar(context, state.message);
          GoRouter.of(context).pop();
          formKey.currentState!.reset();
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading ? true : false,
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
                  'Register',
                  style: AppStyles.medium24,
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextFormField(
                  onFieldSubmitted: (value) {
                    firstName = value;
                  },
                  hintText: 'First Name',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onFieldSubmitted: (value) {
                    lastName = value;
                  },
                  hintText: 'Last Name',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 16,
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
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .register(email: email!, password: password!);
                      var access = getIt.get<AuthRepo>();
                      access.storeUserData(
                          email: email!,
                          password: password!,
                          firstName: firstName!,
                          lastName: lastName!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Register',
                  textColor: Colors.white,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
