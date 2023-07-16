import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/error_snackbar.dart';
import '../../manager/newst_books_cubit/newst_books_cubit.dart';
import '../../manager/newst_books_cubit/newst_books_states.dart';

import 'best_seller_books.dart';

class BestSellerBooksBlocBuilder extends StatefulWidget {
  const BestSellerBooksBlocBuilder({
    super.key,
  });

  @override
  State<BestSellerBooksBlocBuilder> createState() =>
      _BestSellerBooksBlocBuilderState();
}

class _BestSellerBooksBlocBuilderState
    extends State<BestSellerBooksBlocBuilder> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewstBooksCubit, NewstBooksStates>(
        listener: (context, state) {
      if (state is NewstBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is NewstBooksPaginationError) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildShowErrorSnackbar(state.errorMsg),
        );
      }
    }, builder: (context, state) {
      if (state is NewstBooksSuccess ||
          state is NewstBooksPaginationLoading ||
          state is NewstBooksPaginationError) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: BestSellerBooks(
            books: books,
          ),
        );
      } else if (state is NewstBooksError) {
        return Text(state.errorMsg);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
