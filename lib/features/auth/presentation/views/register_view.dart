import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:store_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:store_app/features/auth/presentation/views/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: const Scaffold(
        body: RegisterBody(),
      ),
    );
  }
}
