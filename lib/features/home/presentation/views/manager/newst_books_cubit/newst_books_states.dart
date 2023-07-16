import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';

abstract class NewstBooksStates {}

class NewstBooksInitial extends NewstBooksStates {}

class NewstBooksLoading extends NewstBooksStates {}

class NewstBooksPaginationLoading extends NewstBooksStates {}

class NewstBooksPaginationError extends NewstBooksStates {
  final String errorMsg;
  NewstBooksPaginationError(this.errorMsg);
}

class NewstBooksError extends NewstBooksStates {
  final String errorMsg;
  NewstBooksError(this.errorMsg);
}

class NewstBooksSuccess extends NewstBooksStates {
  final List<BookEntity> books;
  NewstBooksSuccess(this.books);
}
