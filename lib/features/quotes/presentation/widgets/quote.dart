import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quotes_app/core/core.dart';

import '../../notifiers/notifiers.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final quote = QuoteProvider.of(context);
    final quotesNotifier = context.read<QuotesNotifier>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RotatedBox(
                    quarterTurns: 90,
                    child: Icon(Icons.format_quote, size: 36),
                  ),
                  Text(
                    quote.auther,
                    style: context.theme.textTheme.headlineMedium,
                  ),
                  PopupMenuButton(
                    position: PopupMenuPosition.under,
                    constraints: BoxConstraints.tight(const Size(100, 45)),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 100,
                          height: 45,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('Report'),
                                    Spacer(),
                                    Icon(Icons.flag),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quote.body,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.showToast('Copied');
                    },
                    icon: const Icon(Icons.copy),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quote.favorite) {
                            quotesNotifier.unFavorite(quote.id);
                          } else {
                            quotesNotifier.favorite(quote.id);
                          }
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: quote.favorite
                              ? Colors.red
                              : context.theme.iconTheme.color,
                        ),
                      ),
                      Text('${quote.favoritesCount}')
                          .animate(target: quote.favorite ? 1 : 0)
                          .fadeOut(duration: 200.ms) // fade out & then...
                          // swap in original widget & fade back in via a new Animate:
                          .swap(
                            builder: (_, child) => child!.animate().fadeIn(),
                          )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.ios_share),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
