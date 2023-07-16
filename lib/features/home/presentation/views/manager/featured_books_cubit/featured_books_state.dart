part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationError extends FeaturedBooksState {
  final errorMsg;
  FeaturedBooksPaginationError(this.errorMsg);
}

class FeaturedBooksError extends FeaturedBooksState {
  final errorsg;
  FeaturedBooksError(this.errorsg);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  FeaturedBooksSuccess(this.books);
}
