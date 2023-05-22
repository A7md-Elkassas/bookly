import 'package:flutter/material.dart';
import 'package:bookley_app/core/utils/styles.dart';

import 'book_details_actions.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';
import 'custom_book_details_appbar.dart';
import 'similar_books.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBookDetilsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.19),
                  child: const CustomBookImage(),
                ),
                const Text("The jungle Book", style: Styles.textStyle30),
                const SizedBox(height: 8),
                Text("rubyard kiblling",
                    style: Styles.textStyle18
                        .copyWith(fontStyle: FontStyle.italic)),
                const SizedBox(height: 18),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(height: 48),
                const BookDetailsActions(),
                const Expanded(child: SizedBox(height: 50)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("You can also like", style: Styles.textStyle16)),
                const SizedBox(height: 16),
                const SimilarBooks(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
