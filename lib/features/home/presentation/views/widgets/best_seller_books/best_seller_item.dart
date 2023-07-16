import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../book_details/book_details_body_bloc_builder.dart';
import '../book_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.theBook});
  final dynamic theBook;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  GoRouter.of(context).push(AppRouter.kBookDetailsView);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BookDetailsBodyBlocBuilder(bookId: theBook.bookId)));
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.5 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: theBook.image ?? "",
                    fit: BoxFit.fill,
                  ),
                )),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      theBook.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(theBook.authorName!),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(theBook.price!.toString(),
                          style: Styles.textStyle20),
                      const Spacer(),
                      BookRating(
                        rating: theBook.rating ?? 0.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
