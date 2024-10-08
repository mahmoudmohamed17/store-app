import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/cart/presentation/views/sample_square_card.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class AddProductCounterWidget extends StatefulWidget {
  const AddProductCounterWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  State<AddProductCounterWidget> createState() =>
      _AddProductCounterWidgetState();
}

class _AddProductCounterWidgetState extends State<AddProductCounterWidget> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SampleSquareCard(
          onTap: () {
            BlocProvider.of<CartCubit>(context)
                .decrementProduct(product: widget.product);
            if (value > 0) {
              setState(() {
                value--;
              });
            } else {
              value = 0;
            }
          },
          text: '-',
          borderRadiusGeometry: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        SampleSquareCard(text: value.toString()),
        SampleSquareCard(
          onTap: () {
            BlocProvider.of<CartCubit>(context)
                .incrementProduct(product: widget.product);
            setState(() {
              value++;
            });
          },
          text: '+',
          color: kPrimaryColor,
          borderRadiusGeometry: const BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        ),
      ],
    );
  }
}
