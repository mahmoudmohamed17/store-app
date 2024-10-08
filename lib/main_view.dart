import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/core/utilities/api_service.dart';
import 'package:store_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:store_app/features/home/domain/use_cases/get_all_products_use_case.dart';
import 'package:store_app/features/home/presentation/manager/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:store_app/features/profile/presentation/views/profile_view_body.dart';
import 'package:store_app/features/search/data/data_sources/search_local_data_source.dart';
import 'package:store_app/features/search/data/repos/search_repo_impl.dart';
import 'package:store_app/features/search/presentation/manager/get_specific_category_cubit/get_specific_category_cubit.dart';
import 'package:store_app/features/search/presentation/views/search_view_body.dart';

import 'features/cart/presentation/views/cart_view_body.dart';
import 'features/home/data/data_sources/home_remote_data_source.dart';
import 'features/home/data/repos/home_repo_impl.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

int activeIndex = 0;

class _MainViewState extends State<MainView> {
  List<Widget> screens = [
    BlocProvider(
      create: (context) => GetAllProductsCubit(GetAllProductsUseCase(
          HomeRepoImpl(HomeLocalDataSourceImpl(),
              HomeRemoteDataSourceImpl(ApiService())))),
      child: const HomeViewBody(),
    ),
    BlocProvider(
      create: (context) => GetSpecificCategoryCubit(
          SearchRepoImpl(SearchLocalDataSourceImpl(HomeLocalDataSourceImpl()))),
      child: const SearchViewBody(),
    ),
    const CartViewBody(), // 2
    const ProfileViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: activeIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedIconTheme: const IconThemeData(size: 32),
          unselectedIconTheme: const IconThemeData(size: 32),
          currentIndex: activeIndex,
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.magnifyingGlass), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ]),
    );
  }
}
