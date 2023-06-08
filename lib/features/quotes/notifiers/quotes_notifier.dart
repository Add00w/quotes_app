import 'dart:developer';

import 'package:flutter/material.dart';
import '../data/data.dart';

final loadingProvider = ValueNotifier(false);

class QuotesNotifier extends ChangeNotifier {
  @override
  void dispose() {
    // TODO: implement dispose
    log('Disposing [QuotesNotifier]');
    super.dispose();
  }

  late List<QuoteModel> quotes = [];
  late final _repo = QuotesRepository();
  void getQuotes(String endpoint, {String searchTerm = ''}) async {
    loadingProvider.value = true;
    await Future.delayed(const Duration(seconds: 1));

    final res = await _repo.quotes(endpoint, searchTerm: searchTerm);
    quotes = res;

    loadingProvider.value = false;

    notifyListeners();
  }

  void create({
    required String body,
    String? auther,
  }) async {
    loadingProvider.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final createdQuote = await _repo.create(body: body, auther: auther);
    quotes.add(createdQuote);
    loadingProvider.value = false;
    notifyListeners();
  }

  void favorite(int id) async {
    quotes = [
      for (final quote in quotes)
        if (quote.id == id)
          quote.copyWith(
            favorite: true,
            favoritesCount: quote.favoritesCount + 1,
          )
        else
          quote
    ];

    notifyListeners();
  }

  void unFavorite(int id) async {
    quotes = [
      for (final quote in quotes)
        if (quote.id == id)
          quote.copyWith(
            favorite: false,
            favoritesCount: quote.favoritesCount - 1,
          )
        else
          quote
    ];

    notifyListeners();
  }
}
