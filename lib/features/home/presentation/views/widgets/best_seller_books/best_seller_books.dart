import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:bookley_app/features/home/presentation/views/manager/newst_books_cubit/newst_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_item.dart';

class BestSellerBooks extends StatefulWidget {
  const BestSellerBooks({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BestSellerBooks> createState() => _BestSellerBooksState();
}

class _BestSellerBooksState extends State<BestSellerBooks> {
  final ScrollController _scrollController = ScrollController();
  int nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewstBooksCubit>(context)
            .getNewstBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.books.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) =>
          BestSellerItem(theBook: widget.books[index]),
    );
  }
}
