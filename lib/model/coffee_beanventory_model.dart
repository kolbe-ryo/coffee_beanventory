// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coffee_beanventory/enum/color_index_enum.dart';

part 'coffee_beanventory_model.freezed.dart';
part 'coffee_beanventory_model.g.dart';

@freezed
class CoffeeBeanventoryModel with _$CoffeeBeanventoryModel {
  factory CoffeeBeanventoryModel({
    @Default(ColorIndexEnum.warm) ColorIndexEnum colorIndex,
    @Default(0) int beanGrams,
    @Default(0) int beanStockMax,
    @Default(0) int beanAddMax,
    @Default(0) int addBeans,
    @Default(0) int useBeans,
  }) = _CoffeeBeanventoryModel;

  factory CoffeeBeanventoryModel.fromJson(Map<String, dynamic> json) => _$CoffeeBeanventoryModelFromJson(json);
}
