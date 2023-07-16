import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:bookley_app/core/utils/styles.dart';

import '../book_rating.dart';
import '../custom_book_details_appbar.dart';
import '../custom_book_image.dart';
import '../similar_books.dart';
import 'book_details_actions.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookEntity? book;
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
                  child: CustomBookImage(
                    imageUrl: book!.image ?? "",
                  ),
                ),
                Text(
                  book!.title!,
                  style: Styles.textStyle30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(book!.authorName!,
                    style: Styles.textStyle18
                        .copyWith(fontStyle: FontStyle.italic)),
                const SizedBox(height: 18),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  rating: book!.rating ?? 0.0,
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
