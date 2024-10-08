import 'package:flutter/material.dart';

import 'product_size_widget.dart';

class ProductSizeWidgetListView extends StatefulWidget {
  const ProductSizeWidgetListView({super.key});

  @override
  State<ProductSizeWidgetListView> createState() =>
      _ProductSizeWidgetListViewState();
}

List<String> sizes = [
  'S', 'M', 'L', 'XL', 'XXL', 'XXXL'
];

class _ProductSizeWidgetListViewState extends State<ProductSizeWidgetListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      // width: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return ProductSizeWidget(
              isActive: currentIndex == index,
              onTap: () {
                currentIndex = index;
                  setState(() {});
              },
              size: sizes[index],
            );
          }),
    );
  }
}
