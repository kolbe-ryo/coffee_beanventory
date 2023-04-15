// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_beanventory_model.freezed.dart';

@freezed
class CoffeeBeanventoryModel with _$CoffeeBeanventoryModel {
  const factory CoffeeBeanventoryModel({
    // equals quantities of beans
    @Default(0) int grams,
  }) = _CoffeeBeanventoryModel;
}
