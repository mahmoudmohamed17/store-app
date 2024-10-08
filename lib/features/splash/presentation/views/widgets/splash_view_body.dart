import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utilities/app_router.dart';
import 'package:store_app/core/utilities/assets_data.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(height: 250, width: 250, image: AssetImage(AssetsData.logo))
        ],
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go(AppRouter.kLoginView);
    });
  }
}
