import 'package:flutter/material.dart';

import 'core/core.dart';
import 'splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: context.theme.colorScheme.copyWith(primary: primaryColor),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:
            context.theme.bottomNavigationBarTheme.copyWith(
          backgroundColor: Colors.white,
        ),
        floatingActionButtonTheme:
            context.theme.floatingActionButtonTheme.copyWith(
          backgroundColor: primaryColor,
        ),
        snackBarTheme: context.theme.snackBarTheme.copyWith(
          backgroundColor: primaryColor,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
        ),
        dividerTheme: context.theme.dividerTheme.copyWith(
          color: Colors.grey,
        ),
        appBarTheme: context.theme.appBarTheme.copyWith(
          centerTitle: false,
        ),
      ),
      builder: (_, child) => _Unfocus(child: child!),
      home: const SplashView(),
    );
  }
}

/// A widget that unfocus everything when tapped.
///
/// This implements the "Unfocus when tapping in empty space" behavior for the
/// entire application.
class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
