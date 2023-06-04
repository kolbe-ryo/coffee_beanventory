// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';

part 'coffee_beanventory_model.freezed.dart';
part 'coffee_beanventory_model.g.dart';

@freezed
class CoffeeBeanventoryModel with _$CoffeeBeanventoryModel {
  const factory CoffeeBeanventoryModel({
    // Color Theme
    @Default(ColorIndexEnum.warm) ColorIndexEnum colorIndex,
    // Coffee Bean Name
    @Default('Coffee Name') String coffeeName,
    // Storage Bean Grams
    @Default(0) int beanGrams,
    // Storage Size For Beans
    @Default(100) int beanStockMax,
    // Max Adding Size
    @Default(100) int beanAddMax,
    // Previous Adding Size
    @Default(0) int addBeans,
    // Previous Using Size
    @Default(0) int useBeans,
  }) = _CoffeeBeanventoryModel;

  const CoffeeBeanventoryModel._();

  factory CoffeeBeanventoryModel.fromJson(Map<String, dynamic> json) => _$CoffeeBeanventoryModelFromJson(json);
}
