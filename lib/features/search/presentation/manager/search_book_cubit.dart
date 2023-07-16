import 'package:bookley_app/features/search/domain/use_cases/search_book_use_case.dart';
import 'package:bookley_app/features/search/presentation/manager/search_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookCubit extends Cubit<SearchBookStates> {
  SearchBookCubit(this.searchBookUseCase) : super(SearchBookInitialState());
  final SearchBookUseCase searchBookUseCase;

  var searchCtrl = TextEditingController();
  Future<void> searchBook({String? bookName}) async {
    emit(SearchBookLoadingState());
    var response = await searchBookUseCase.call(bookName!);
    response.fold((failure) {
      emit(SearchBookErrorState(failure.message));
    }, (books) {
      emit(SearchBookSuccessState(books));
    });
  }
}
