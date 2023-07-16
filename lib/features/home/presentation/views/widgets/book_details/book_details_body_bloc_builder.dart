import 'package:bookley_app/features/home/presentation/views/widgets/book_details/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/setup_service_locator.dart';
import '../../../../data/repos/home_repo_impl.dart';
import '../../../../domain/use_cases/fetch_book_details_use_case.dart';
import '../../manager/fetch_book_details_cubit/fetch_book_details_cubit.dart';
import '../../manager/fetch_book_details_cubit/fetch_book_details_states.dart';

class BookDetailsBodyBlocBuilder extends StatelessWidget {
  const BookDetailsBodyBlocBuilder({super.key, required this.bookId});
  final String bookId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return FetchBookDetailsCubit(
          FetchBookDetailsUseCase(
            getIt.get<HomeRepoImpl>(),
          ),
        )..getBookDetails(bookId);
      },
      child: Material(
        child: SafeArea(
          child: BlocBuilder<FetchBookDetailsCubit, FetchBookDetailsStates>(
            builder: (context, state) {
              if (state is FetchBookDetailsSuccessState) {
                return BookDetailsBody(book: state.book);
              } else if (state is FetchBookDetailsErrorState) {
                return Text(state.errorMsg);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
