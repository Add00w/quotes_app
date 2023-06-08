import 'dart:developer';

import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  @override
  void dispose() {
    // TODO: implement dispose
    log('Disposing [AuthNotifier]');
    super.dispose();
  }
}
