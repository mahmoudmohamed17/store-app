import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_info_view_body.dart';

class ProductInfoView extends StatelessWidget {
  const ProductInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 32),
      ),
      body: const ProductInfoViewBody(),
    );
  }
}
