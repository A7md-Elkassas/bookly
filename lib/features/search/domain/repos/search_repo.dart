import 'package:bookley_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../entities/search_book_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchBookEntity>>> searchBook({String? book});
}
