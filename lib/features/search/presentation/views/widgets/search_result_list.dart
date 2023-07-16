import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_books/best_seller_item.dart';
import '../../../domain/entities/search_book_entity.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key, required this.bookEntity});

  final List<SearchBookEntity> bookEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookEntity.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) => BestSellerItem(
        theBook: bookEntity[index],
      ),
    );
  }
}
