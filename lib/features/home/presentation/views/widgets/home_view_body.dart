import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/core/widgets/custom_app_bar.dart';
import 'package:store_app/features/home/presentation/manager/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(text: 'Home'),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                'Popular products',
                style: AppStyles.semiBold16.copyWith(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
            builder: (context, state) {
              if (state is GetAllProductsSuccess) {
                return ProductsGridView(
                  products: state.products,
                );
              } else if (state is GetAllProductsFailure) {
                return Center(
                  child: Text(
                    state.errorMsg,
                    style: AppStyles.semiBold20,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
