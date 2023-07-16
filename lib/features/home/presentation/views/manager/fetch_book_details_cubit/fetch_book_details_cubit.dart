import 'package:bookley_app/features/home/domain/use_cases/fetch_book_details_use_case.dart';
import 'package:bookley_app/features/home/presentation/views/manager/fetch_book_details_cubit/fetch_book_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBookDetailsCubit extends Cubit<FetchBookDetailsStates> {
  FetchBookDetailsCubit(this.fetchBookDetailsUseCase)
      : super(FetchBookDetailsInitialState());
  FetchBookDetailsUseCase fetchBookDetailsUseCase;

  Future<void> getBookDetails(String bookId) async {
    emit(FetchBookDetailsLoadingState());
    var result = await fetchBookDetailsUseCase.call(bookId);
    result.fold((failure) {
      emit(FetchBookDetailsErrorState(failure.message));
    }, (book) {
      emit(FetchBookDetailsSuccessState(book));
    });
  }
}
