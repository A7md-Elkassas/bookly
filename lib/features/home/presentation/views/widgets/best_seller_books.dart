import 'package:flutter/material.dart';

import 'best_seller_item.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) => const BestSellerItem(),
    );
  }
}
