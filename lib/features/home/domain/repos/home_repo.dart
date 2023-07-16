import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks(
      {int pageNumber = 0});
  Future<Either<Failure, BookEntity>> fetchBookDetails({String bookId});
}
