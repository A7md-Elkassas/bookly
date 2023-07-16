import 'package:bookley_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entitites/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewstBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber *
        10; // if p = 0 -- s = 0 ,  p = 1 -- s = 10 , p = 2 -- s= 20
    int endIndex =
        (pageNumber + 1) * 10; // then  end = 10 , end = 20 , end = 30
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewstBooks({int pageNumber = 0}) {
    int startIndex =
        pageNumber * 10; // if p = 0  -- start = 0, p = 1 -- start 10,
    int endIndex = (pageNumber + 1) *
        startIndex; // then  end = 1 *0 = 0; end = 2 *10 = 20 ;
    var box = Hive.box<BookEntity>(kNewstBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
