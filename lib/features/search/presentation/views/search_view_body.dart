import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_app_bar.dart';
import 'package:store_app/features/search/presentation/manager/get_specific_category_cubit/get_specific_category_cubit.dart';
import 'package:store_app/features/search/presentation/views/empty_search_body.dart';
import 'package:store_app/features/search/presentation/views/result_search_body.dart';
import 'package:store_app/features/search/presentation/views/search_item_widgets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CustomAppBar(text: 'Search'),
          const SizedBox(
            height: 10,
          ),
          const SearchItemWidgets(),
          BlocBuilder<GetSpecificCategoryCubit, GetSpecificCategoryState>(
            builder: (context, state) {
              if (state is GetSpecificCategorySuccess) {
                return Expanded(
                    child: ResultSearchBody(
                  products: state.products,
                  category: state.categoryName,
                ));
              } else {
                return const Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: EmptySearchBody(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
