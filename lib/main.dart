import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:vk/src/common/app/widget/app.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(const App());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
