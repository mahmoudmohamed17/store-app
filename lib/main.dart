import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/core/utilities/app_router.dart';
import 'package:store_app/core/utilities/functions/setup_service_locator.dart';
import 'package:store_app/features/auth/data/models/user_info_model.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/sample_bloc_observerd.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(UserInfoModelAdapter());
  await Hive.openBox<ProductEntity>(kProductEntityBox);
  await Hive.openBox(kEmailIdBox);
  Bloc.observer = SampleBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
