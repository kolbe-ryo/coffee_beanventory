// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:coffee_beanventory/enum/color_index_enum.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState({
    @Default(ColorIndexEnum.warm) ColorIndexEnum colorIndex,
    @Default(0) int beanGrams,
    @Default(0) int beanStockMax,
    @Default(0) int beanAddMax,
  }) = _GlobalState;
}
