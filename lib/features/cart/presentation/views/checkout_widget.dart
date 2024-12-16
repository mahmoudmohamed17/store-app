import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../../../constanst.dart';
import '../../../../core/utilities/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 15, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: AppStyles.semiBold16,
                      ),
                      Text(
                        r'$'
                        '${BlocProvider.of<CartCubit>(context).totalPrice}',
                        style: AppStyles.semiBold16,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomButton(
                    text: 'Checkout',
                    textColor: Colors.white,
                    color: Colors.black,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
