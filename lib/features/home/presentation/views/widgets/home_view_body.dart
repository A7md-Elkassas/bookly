import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'best_seller_books.dart';
import 'custom_app_bar.dart';
import 'featured_books.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedBooks(),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: 30,
            ),
            child: Text("Best Seller", style: Styles.textStyle18),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerBooks(),
          ),
        ],
      ),
    );
  }
}
