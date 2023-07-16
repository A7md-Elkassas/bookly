import 'package:bookley_app/core/errors/failure.dart';
import 'package:bookley_app/core/use_cases/use_case.dart';
import 'package:bookley_app/features/home/domain/entitites/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../repos/home_repo.dart';

class FetchBookDetailsUseCase extends UseCase<BookEntity, String> {
  final HomeRepo homeRepo;
  FetchBookDetailsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, BookEntity>> call([String? param]) {
    return homeRepo.fetchBookDetails(bookId: param!);
  }
}
