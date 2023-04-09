// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';

void setUpDI() {
  GetIt.I.registerLazySingleton<GlobalKey<NavigatorState>>(_globalKey);
}

GlobalKey<NavigatorState> _globalKey() => GlobalKey();
