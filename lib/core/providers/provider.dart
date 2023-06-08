import 'package:flutter/material.dart';

import 'notifier.dart';

class Provider<T extends ChangeNotifier> extends StatefulWidget {
  const Provider({Key? key, required this.create, required this.child})
      : super(key: key);
  final Widget child;
  final T Function() create;
  @override
  State<Provider<T>> createState() => _ProviderState<T>();
}

class _ProviderState<T extends ChangeNotifier> extends State<Provider<T>> {
  late final T _notifier = widget.create();
  @override
  void dispose() {
    if (!_notifier.hasListeners) {
      _notifier.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QuotesInheritedNotifier<T>(notifier: _notifier, child: widget.child);
  }
}
