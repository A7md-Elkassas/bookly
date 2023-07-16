import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/error_snackbar.dart';
import '../../../../domain/entitites/book_entity.dart';

import '../../manager/featured_books_cubit/featured_books_cubit.dart';

import 'featured_books.dart';

class FeaturedBooksBlocBuilder extends StatefulWidget {
  const FeaturedBooksBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksBlocBuilder> createState() =>
      _FeaturedBooksBlocBuilderState();
}

class _FeaturedBooksBlocBuilderState extends State<FeaturedBooksBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is FeaturedBooksPaginationError) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildShowErrorSnackbar(state.errorMsg),
        );
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksError) {
        return Center(child: Text(state.errorsg));
      } else if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationError) {
        return FeaturedBooks(books: books);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
