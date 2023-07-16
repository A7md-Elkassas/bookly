import 'package:bookley_app/core/errors/failure.dart';
import 'package:bookley_app/core/use_cases/use_case.dart';
import 'package:bookley_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../entitites/book_entity.dart';

class FetchNewstBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewstBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) {
    debugPrint(param.toString());
    return homeRepo.fetchNewstBooks(pageNumber: param);
  }
}
