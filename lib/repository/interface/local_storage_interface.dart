// Project imports:
import 'package:coffee_beanventory/model/coffee_beanventory_model.dart';

abstract class LocalStorageInterface {
  Future<void> save(CoffeeBeanventoryModel model);

  Future<CoffeeBeanventoryModel?> fetch();
}
