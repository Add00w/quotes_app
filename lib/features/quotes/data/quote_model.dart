import '../../auth/auth.dart';

class QuoteModel {
  final int id;
  final String body;
  final int favoritesCount;
  final bool favorite;
  final String auther;
  final String publishedDate;
  final User publisher;

  QuoteModel({
    required this.id,
    required this.body,
    required this.favorite,
    required this.favoritesCount,
    this.auther = 'anonymous',
    required this.publishedDate,
    required this.publisher,
  });
  QuoteModel copyWith({
    int? favoritesCount,
    bool? favorite,
  }) {
    return QuoteModel(
      id: id,
      body: body,
      favorite: favorite ?? this.favorite,
      favoritesCount: favoritesCount ?? this.favoritesCount,
      publishedDate: publishedDate,
      publisher: publisher,
      auther: auther,
    );
  }
}
