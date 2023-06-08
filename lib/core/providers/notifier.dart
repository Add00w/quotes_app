import 'package:flutter/material.dart';

class QuotesInheritedNotifier<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  const QuotesInheritedNotifier({
    Key? key,
    required T notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);
}
