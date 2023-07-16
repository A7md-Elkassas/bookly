import 'package:hive/hive.dart';

import '../../features/home/domain/entitites/book_entity.dart';

void cacheBooks(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
