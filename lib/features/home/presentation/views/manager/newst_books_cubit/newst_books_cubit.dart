import 'package:bookley_app/features/home/domain/use_cases/fetch_newst_books_use_case.dart';
import 'package:bookley_app/features/home/presentation/views/manager/newst_books_cubit/newst_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewstBooksCubit extends Cubit<NewstBooksStates> {
  NewstBooksCubit(this.newstBooksUseCase) : super(NewstBooksInitial());

  FetchNewstBooksUseCase newstBooksUseCase;
  Future<void> getNewstBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewstBooksLoading());
    } else {
      emit(NewstBooksPaginationLoading());
    }
    var result = await newstBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewstBooksError(failure.message));
      } else {
        emit(NewstBooksPaginationError(failure.message));
      }
    }, (books) {
      emit(NewstBooksSuccess(books));
    });
  }
}
