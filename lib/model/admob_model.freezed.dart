// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admob_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdmobModel {
  int get admobCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdmobModelCopyWith<AdmobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdmobModelCopyWith<$Res> {
  factory $AdmobModelCopyWith(
          AdmobModel value, $Res Function(AdmobModel) then) =
      _$AdmobModelCopyWithImpl<$Res, AdmobModel>;
  @useResult
  $Res call({int admobCount});
}

/// @nodoc
class _$AdmobModelCopyWithImpl<$Res, $Val extends AdmobModel>
    implements $AdmobModelCopyWith<$Res> {
  _$AdmobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admobCount = null,
  }) {
    return _then(_value.copyWith(
      admobCount: null == admobCount
          ? _value.admobCount
          : admobCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdmobModelCopyWith<$Res>
    implements $AdmobModelCopyWith<$Res> {
  factory _$$_AdmobModelCopyWith(
          _$_AdmobModel value, $Res Function(_$_AdmobModel) then) =
      __$$_AdmobModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int admobCount});
}

/// @nodoc
class __$$_AdmobModelCopyWithImpl<$Res>
    extends _$AdmobModelCopyWithImpl<$Res, _$_AdmobModel>
    implements _$$_AdmobModelCopyWith<$Res> {
  __$$_AdmobModelCopyWithImpl(
      _$_AdmobModel _value, $Res Function(_$_AdmobModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admobCount = null,
  }) {
    return _then(_$_AdmobModel(
      admobCount: null == admobCount
          ? _value.admobCount
          : admobCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AdmobModel extends _AdmobModel {
  const _$_AdmobModel({this.admobCount = 0}) : super._();

  @override
  @JsonKey()
  final int admobCount;

  @override
  String toString() {
    return 'AdmobModel(admobCount: $admobCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdmobModel &&
            (identical(other.admobCount, admobCount) ||
                other.admobCount == admobCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, admobCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdmobModelCopyWith<_$_AdmobModel> get copyWith =>
      __$$_AdmobModelCopyWithImpl<_$_AdmobModel>(this, _$identity);
}

abstract class _AdmobModel extends AdmobModel {
  const factory _AdmobModel({final int admobCount}) = _$_AdmobModel;
  const _AdmobModel._() : super._();

  @override
  int get admobCount;
  @override
  @JsonKey(ignore: true)
  _$$_AdmobModelCopyWith<_$_AdmobModel> get copyWith =>
      throw _privateConstructorUsedError;
}
