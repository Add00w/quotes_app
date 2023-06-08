import 'package:flutter/material.dart'
    show BuildContext, InheritedNotifier, ValueNotifier;

import '../data/data.dart';

class QuoteProvider extends InheritedNotifier<ValueNotifier<QuoteModel>> {
  const QuoteProvider({super.key, super.notifier, required super.child});
  static QuoteModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<QuoteProvider>()!
        .notifier!
        .value;
  }
}
