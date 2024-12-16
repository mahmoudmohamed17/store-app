import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utilities/app_styles.dart';
import 'package:store_app/features/search/presentation/manager/get_specific_category_cubit/get_specific_category_cubit.dart';

class SearchProductItem extends StatelessWidget {
  const SearchProductItem(
      {super.key,
      required this.image,
      required this.title,
      required this.cetegory});
  final String image;
  final String title;
  final String cetegory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<GetSpecificCategoryCubit>(context)
              .getSpecificCategory(category: cetegory);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image))),
            height: 110,
            width: 370,
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppStyles.semiBold20.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
