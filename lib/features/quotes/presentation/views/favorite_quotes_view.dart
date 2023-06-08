import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quotes_app/core/core.dart';

import '../../quotes.dart';

class FavoriteQuotesView extends StatelessWidget {
  const FavoriteQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteQuotes = context.watch<QuotesNotifier>().quotes;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ValueListenableBuilder(
        valueListenable: loadingProvider,
        builder: (context, loading, child) {
          return loading ? const LoadingWidget() : child!;
        },
        child: ListView.builder(
          itemBuilder: (_, index) {
            return QuoteProvider(
              notifier: ValueNotifier(favoriteQuotes[index]),
              child: const QuoteWidget()
                  .animate()
                  .then(delay: (200 * index).ms)
                  .slide(begin: const Offset(-1, 0)),
            );
          },
          itemCount: favoriteQuotes.length,
        ),
      ),
    );
  }
}
