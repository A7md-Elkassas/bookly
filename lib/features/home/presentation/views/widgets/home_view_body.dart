import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'best_seller_books/best_seller_bloc_builder.dart';
import 'custom_app_bar.dart';
import 'featured_books/featured_books_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksBlocBuilder(),
              Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 30,
                ),
                child: Text("Best Seller", style: Styles.textStyle18),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerBooksBlocBuilder(),
        ),
      ],
    );
  }
}
