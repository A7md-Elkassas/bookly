import 'package:bookley_app/core/errors/failure.dart';

import 'package:bookley_app/features/search/data/data_source/seach_book_remote_datasource.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/search_book_entity.dart';
import '../../domain/repos/search_repo.dart';

class SearchBookRepoImpl extends SearchRepo {
  SearchBookRemoteDataSource searchBookRemoteDataSource;
  SearchBookRepoImpl(this.searchBookRemoteDataSource);
  @override
  Future<Either<Failure, List<SearchBookEntity>>> searchBook(
      {String? book}) async {
    try {
      var result = await searchBookRemoteDataSource.searchBook(book: book!);
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(message: e.toString()));
      }
    }
  }
}
