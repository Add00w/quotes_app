import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quotes_app/core/core.dart';

import '../../notifiers/notifiers.dart';
import '../widgets/widgets.dart';
import 'create_quote_view.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = context.watch<QuotesNotifier>().quotes;
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.push(
            Provider(
              create: () => context.read<QuotesNotifier>(),
              child: const CreateQuoteView(),
            ),
          );
        },
      ).animate(
        onPlay: (controller) {
          controller.repeat(); // Repeat shake effect every 15 seconds
        },
      ).shake(
        delay: 15.seconds,
        offset: const Offset(-5, 5),
      ),
      body: ValueListenableBuilder(
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
    );
  }
}
