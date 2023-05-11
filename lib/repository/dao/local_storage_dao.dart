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

  @override
  Future<CoffeeBeanventoryModel> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> save(CoffeeBeanventoryModel model) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
