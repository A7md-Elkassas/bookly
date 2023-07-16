import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';

abstract class FetchBookDetailsStates {}

class FetchBookDetailsInitialState extends FetchBookDetailsStates {}

class FetchBookDetailsLoadingState extends FetchBookDetailsStates {}

class FetchBookDetailsSuccessState extends FetchBookDetailsStates {
  final BookEntity book;
  FetchBookDetailsSuccessState(this.book);
}

class FetchBookDetailsErrorState extends FetchBookDetailsStates {
  final String errorMsg;
  FetchBookDetailsErrorState(this.errorMsg);
}
