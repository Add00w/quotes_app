import 'package:flutter/material.dart';

import '../core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    this.onType,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    super.key,
  });
  final String label;
  final TextEditingController controller;
  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final void Function(String search)? onType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onType,
      decoration: InputDecoration(
        filled: true,
        fillColor: secondaryColor,
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
