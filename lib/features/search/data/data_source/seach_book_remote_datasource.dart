import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/end_points.dart';
import '../../domain/entities/search_book_entity.dart';
import '../models/search_model.dart';

abstract class SearchBookRemoteDataSource {
  Future<List<SearchBookEntity>> searchBook({String? book});
}

class SearchBookRemoteDataSourceImpl extends SearchBookRemoteDataSource {
  ApiService apiService;

  SearchBookRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<SearchBookEntity>> searchBook({String? book}) async {
    var data = await apiService.get(endPoint: EndPoints.search, query: {
      "q": book,
    });
    List<SearchBookEntity> books = getBooksList(data);
    return books;
  }

  List<SearchBookEntity> getBooksList(Map<String, dynamic> data) {
    List<SearchBookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(SearchModel.fromJson(bookMap));
    }
    return books;
  }
}
