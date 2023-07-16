import 'package:bookley_app/features/home/presentation/views/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entitites/book_entity.dart';
import '../custom_book_image.dart';

class FeaturedBooks extends StatefulWidget {
  const FeaturedBooks({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooks> createState() => _FeaturedBooksState();
}

class _FeaturedBooksState extends State<FeaturedBooks> {
  final ScrollController _scrollController = ScrollController();
  int index = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .getFeaturedBooks(pageNumber: index++);

        isLoading = false;
        debugPrint(index.toString());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 30),
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CustomBookImage(
                imageUrl: widget.books[index].image ?? '',
              ),
            );
          }),
    );
  }
}
