import 'package:bookley_app/constants.dart';
import 'package:bookley_app/core/utils/api_service.dart';
import 'package:bookley_app/core/utils/end_points.dart';
import 'package:bookley_app/features/home/data/models/book_model/book_model.dart';

import '../../../../core/functions/cache_books.dart';
import '../../domain/entitites/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewstBooks({int pageNumber = 0});
  Future<BookEntity> fetchBookDetails({String? bookId});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    String endPoint =
        "${EndPoints.featuredBooks}&startIndex=${pageNumber * 10}";
    var data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    cacheBooks(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewstBooks({int pageNumber = 0}) async {
    String endPoint = "${EndPoints.newestBooks}&startIndex=${pageNumber * 10}";
    var data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    cacheBooks(books, kNewstBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }

    return books;
  }

  @override
  Future<BookEntity> fetchBookDetails({String? bookId}) async {
    String endPoint = "${EndPoints.bookDetails}$bookId";
    var data = await apiService.get(endPoint: endPoint);
    BookEntity book = BookModel.fromJson(data);
    return book;
  }
}

// class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
//   final ApiService apiService;
//   BookModel? bookModel;
//   HomeRemoteDataSourceImpl(this.apiService);
//   @override
//   Future<List<BookEntity>> fetchFeaturedBooks() async {
//     var books = await apiService.get(endPoint: EndPoints.featuredBooks);
//     bookModel = BookModel.fromJson(books);
//     debugPrint("$bookModel");
//     return bookModel;
//   }

//   @override
//   Future<List<BookEntity>> fetchNewstBooks() async {
//     var books = await apiService.get(endPoint: EndPoints.newestBooks);
//     bookModel = BookModel.fromJson(books);
//     return bookModel!.items;
//   }
// }
