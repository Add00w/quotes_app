import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.questionText,
    required this.clickableText,
    required this.onTap,
    super.key,
  });
  final String questionText;
  final String clickableText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: questionText,
          style: context.theme.textTheme.labelLarge,
          children: [
            TextSpan(
              text: clickableText,
              style: context.theme.textTheme.labelLarge!.copyWith(
                color: primaryColor,
              ),
              // TODO test if not disposing this gesture
              // has an impact
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
