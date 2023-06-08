import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.format_quote, size: 100, color: primaryColor),
    )
        .animate(
          onPlay: (controller) => controller.repeat,
        )
        .rotate();
  }
}
