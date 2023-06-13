// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/repository/dao/local_storage_dao.dart';
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';

void setUpDI() {
  GetIt.I.registerLazySingleton<GlobalKey<NavigatorState>>(_globalKey);
}

GlobalKey<NavigatorState> _globalKey() => GlobalKey();

final localStorageInterfaceProvider = Provider<LocalStorageInterface>((ref) => LocalStorageDao());
