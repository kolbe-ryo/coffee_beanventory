// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admob_model.freezed.dart';

@freezed
class AdmobModel with _$AdmobModel {
  const factory AdmobModel({
    @Default(0) int admobCount,
  }) = _AdmobModel;

  const AdmobModel._();

  bool get isDisplayAdmob => admobCount > 10;
}
