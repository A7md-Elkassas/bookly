class BookEntity {
  final String? title;
  final String bookId;
  final String? author;
  final String? image;
  final num? price;
  final num? rating;

  BookEntity(
      {required this.bookId,
      required this.title,
      required this.author,
      required this.image,
      required this.price,
      required this.rating});
}
