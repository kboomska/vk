import 'dart:async';
import 'dart:developer';

import 'package:vk/src/common/app/logic/app_runner.dart';

void main() {
  // TODO(kboomska): implement logger
  runZonedGuarded(
    () => const AppRunner().initializeAndRun(),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
