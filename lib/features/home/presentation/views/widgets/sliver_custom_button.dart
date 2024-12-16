import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';

class SliverCustomButton extends StatelessWidget {
  const SliverCustomButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.textColor,
      required this.boxColor});
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final Color boxColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartRemoved) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                onTap: onTap,
                text: text,
                textColor: textColor,
                color: boxColor,
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                onTap: onTap,
                text: text,
                textColor: textColor,
                color: boxColor,
              ),
            ),
          );
        }
      },
    );
  }
}