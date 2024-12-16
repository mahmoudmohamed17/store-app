import 'package:flutter/material.dart';
import 'package:store_app/core/utilities/assets_data.dart';
import 'search_product_item.dart';

class SearchItemWidgets extends StatelessWidget {
  const SearchItemWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.7),
        children: [
          SearchProductItem(
            image: AssetsData.mensClothing,
            title: 'Men\'s Clothing',
            cetegory: "men's clothing",
          ),
          SearchProductItem(
            image: AssetsData.womensClothing,
            title: 'Women\'s Clothing',
            cetegory: "women's clothing",
          ),
          SearchProductItem(
            image: AssetsData.jewelry,
            title: 'Jewelry',
            cetegory: 'jewelery',
          ),
          SearchProductItem(
            image: AssetsData.electronics,
            title: 'Electronics',
            cetegory: 'electronics',
          ),
        ],
      ),
    );
  }
}
