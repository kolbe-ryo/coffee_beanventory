// Flutter imports:
import 'package:coffee_beanventory/repository/dao/local_storage_dao.dart';
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';

void setUpDI() {
  GetIt.I.registerLazySingleton<GlobalKey<NavigatorState>>(_globalKey);
  GetIt.I.registerLazySingleton(_interface);
}

GlobalKey<NavigatorState> _globalKey() => GlobalKey();

LocalStorageInterface _interface() => LocalStorageDao();
