import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quotes_app/core/core.dart';

import '../../../quotes/quotes.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final quotes = context.watch<QuotesNotifier>().quotes;

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'Search a quote',
              controller: controller,
              onType: (search) {
                Future.delayed(const Duration(milliseconds: 500), () {
                  context
                      .read<QuotesNotifier>()
                      .getQuotes('search', searchTerm: search.toLowerCase());
                });
              },
            ),
            Flexible(
              child: ValueListenableBuilder(
                valueListenable: loadingProvider,
                builder: (context, loading, child) {
                  return loading ? const LoadingWidget() : child!;
                },
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return QuoteProvider(
                      notifier: ValueNotifier(quotes[index]),
                      child: const QuoteWidget()
                          .animate()
                          .then(delay: (200 * index).ms)
                          .slide(begin: const Offset(-1, 0)),
                    );
                  },
                  itemCount: quotes.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
