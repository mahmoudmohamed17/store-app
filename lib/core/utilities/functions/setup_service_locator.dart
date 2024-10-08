import 'package:get_it/get_it.dart';
import 'package:store_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';

import '../../../features/auth/data/repos/auth_repo_impl.dart';
import '../../../features/auth/domain/auth_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
   getIt.registerSingleton<FavoritesCubit>(FavoritesCubit());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

}