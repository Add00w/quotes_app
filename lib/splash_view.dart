import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'core/core.dart';
import 'home.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.pushReplacement(HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RotatedBox(
              quarterTurns: 90,
              child: Icon(Icons.format_quote, size: 100, color: Colors.white),
            ),
            Text(
              'Quotes',
              style: context.theme.textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                height: 0.1,
              ),
            ),
          ].animate(interval: 400.ms).fade(duration: 300.ms),
        ),
      ),
    );
  }
}
