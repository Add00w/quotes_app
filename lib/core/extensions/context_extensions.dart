import 'package:flutter/material.dart';

import '../core.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  void push(Widget view) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => view),
    );
  }

  void pushReplacement(Widget view) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => view),
    );
  }

  void showToast(String content) {
    final snackBar = SnackBar(
      content: Text(content),
      backgroundColor: primaryColor,
    );
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  T watch<T extends ChangeNotifier>() {
    return dependOnInheritedWidgetOfExactType<QuotesInheritedNotifier<T>>()!
        .notifier!;
  }

  T read<T extends ChangeNotifier>() {
    return findAncestorWidgetOfExactType<QuotesInheritedNotifier<T>>()!
        .notifier!;
  }
}
