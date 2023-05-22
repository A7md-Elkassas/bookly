import 'package:bookley_app/core/utils/api_service.dart';
import 'package:bookley_app/core/utils/end_points.dart';
import 'package:bookley_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../domain/entitites/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewstBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  BookModel? bookModel;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var books = await apiService.get(endPoint: EndPoints.featuredBooks);
    bookModel = BookModel.fromJson(books);
    debugPrint("$bookModel");
    debugPrint("${bookModel!.items}");
    return bookModel!.items;
  }

  @override
  Future<List<BookEntity>> fetchNewstBooks() async {
    var books = await apiService.get(endPoint: EndPoints.newestBooks);
    bookModel = BookModel.fromJson(books);
    return bookModel!.items;
  }
}
