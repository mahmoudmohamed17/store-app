import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:store_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
