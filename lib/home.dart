import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/quotes/quotes.dart';
import 'features/search/search.dart';
import 'features/settings/more_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _pages = [
    Provider(
      create: () => QuotesNotifier()..getQuotes('/quotes'),
      child: const QuotesView(),
    ),
    Provider(
      create: () => QuotesNotifier()..getQuotes('/search'),
      child: const SearchView(),
    ),
    const MoreView()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (_, index, __) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.format_quote), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
          ],
          onTap: (index) {
            selectedIndex.value = index;
          },
        ),
        body: _pages[selectedIndex.value],
      ),
    );
  }
}

final selectedIndex = ValueNotifier(0);
