import 'package:bookley_app/features/home/presentation/views/widgets/book_details/book_details_body_bloc_builder.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, this.bookId});
  final String? bookId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: BookDetailsBodyBlocBuilder(bookId: bookId!)));
  }
}
