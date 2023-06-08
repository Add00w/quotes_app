import 'dart:math';

import '../../auth/auth.dart';
import './quote_model.dart';

class QuotesRepository {
  Future<List<QuoteModel>> quotes(String endpoint, {String searchTerm = ''}) {
    var quotes = [
      QuoteModel(
        id: 1,
        body: 'This is our Quot. app, used for saving quotes while '
            'reading paper versions of books and newspapers.',
        publishedDate: '23/4/2023',
        favorite: false,
        favoritesCount: 2,
        publisher: User('1', 'Abdullahi Addow'),
      ),
      QuoteModel(
        id: 2,
        body: 'This is our Quot. app, used for saving quotes while '
            'reading paper versions of books and newspapers.',
        auther: 'Abdullahi Addow',
        favorite: false,
        favoritesCount: 0,
        publishedDate: '25/4/2023',
        publisher: User('2', 'Abdullahi Addow'),
      ),
      QuoteModel(
        id: 3,
        body: 'The negligence of a few could easily send a ship to bottom, '
            'but if it has the wholehearted cooporation of all on board it '
            'can be safely brought to port.',
        favorite: true,
        favoritesCount: 12,
        publishedDate: '25/4/2023',
        publisher: User('3', 'Addow'),
      ),
    ];
    if (searchTerm.isNotEmpty) {
      quotes = quotes
          .where((quote) => quote.body.toLowerCase().contains(searchTerm))
          .toList();
    }
    if (endpoint.contains('/favs')) {
      quotes = quotes.where((quote) => quote.favorite).toList();
    }
    return Future.value(quotes);
  }

  Future<QuoteModel> create({
    required String body,
    String? auther,
  }) {
    final id = Random().nextInt(100);
    return Future.value(
      QuoteModel(
        id: id,
        body: body,
        favorite: false,
        favoritesCount: 0,
        publishedDate: '$id/4/2023',
        publisher: User('$id', 'Addow'),
        auther: auther ?? 'Anonymous',
      ),
    );
  }
}
