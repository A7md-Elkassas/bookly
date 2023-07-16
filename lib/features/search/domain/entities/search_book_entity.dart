class SearchBookEntity {
  final String? title;

  final String bookId;

  final String? authorName;

  final String? image;

  final num? price;

  final num? rating;

  SearchBookEntity(
      {required this.bookId,
      required this.title,
      required this.authorName,
      required this.image,
      required this.price,
      required this.rating});
}
