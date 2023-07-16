import 'package:bookley_app/features/search/domain/entities/search_book_entity.dart';

abstract class SearchBookStates {}

class SearchBookInitialState extends SearchBookStates {}

class SearchBookLoadingState extends SearchBookStates {}

class SearchBookSuccessState extends SearchBookStates {
  final List<SearchBookEntity> books;
  SearchBookSuccessState(this.books);
}

class SearchBookErrorState extends SearchBookStates {
  final String errorMsg;
  SearchBookErrorState(this.errorMsg);
}
