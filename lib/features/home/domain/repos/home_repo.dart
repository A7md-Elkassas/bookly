import 'package:bookley_app/core/errors/failure.dart';
import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks();
}
