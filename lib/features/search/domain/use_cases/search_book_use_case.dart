import 'package:bookley_app/core/errors/failure.dart';
import 'package:bookley_app/core/use_cases/use_case.dart';

import 'package:bookley_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../entities/search_book_entity.dart';

class SearchBookUseCase extends UseCase<List<SearchBookEntity>, String?> {
  SearchRepo searchRepo;

  SearchBookUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<SearchBookEntity>>> call([String? param]) {
    debugPrint(param);
    return searchRepo.searchBook(book: param!);
  }
}
