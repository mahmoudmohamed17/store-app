import 'package:go_router/go_router.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/register_view.dart';
import 'package:store_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:store_app/features/home/presentation/views/product_info_view.dart';
import 'package:store_app/features/splash/presentation/views/splash_view.dart';
import 'package:store_app/main_view.dart';

abstract class AppRouter {
  static const kLoginView = '/kLoginView';
  static const kRegisterView = '/kRegisterView';
  static const kMainView = '/kMainView';
  static const kFavoritesView = '/kFavoritesView';
  static const kProductInfoView = '/kProductInfoView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kMainView,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: kFavoritesView,
      builder: (context, state) => const FavoritesView(),
    ),
    GoRoute(
      path: kProductInfoView,
      builder: (context, state) => const ProductInfoView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
  ]);
}
