import 'dart:convert';

import 'package:coffee_beanventory/model/coffee_beanventory_model.dart';
import 'package:coffee_beanventory/repository/interface/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDao implements LocalStorageInterface {
  factory LocalStorageDao() => _instance;

  LocalStorageDao._internal() {
    _storage = SharedPreferences.getInstance();
  }

  static final _instance = LocalStorageDao._internal();

  late final Future<SharedPreferences> _storage;

  static const String _kStorageKey = 'coffeeBeanventory';

  @override
  Future<CoffeeBeanventoryModel?> fetch() async {
    final storage = await _storage;
    final content = storage.getStringList(_kStorageKey)?.first ?? '';
    if (content.isEmpty) {
      return null;
    }
    return CoffeeBeanventoryModel.fromJson(
      json.decode(content) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> save(CoffeeBeanventoryModel model) async {
    final storage = await _storage;

    final content = [json.encode(model.toJson())];

    await storage.setStringList(_kStorageKey, content);
  }
}
