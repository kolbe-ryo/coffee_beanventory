// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_beanventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoffeeBeanventoryModel {
  int get grams => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoffeeBeanventoryModelCopyWith<CoffeeBeanventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeBeanventoryModelCopyWith<$Res> {
  factory $CoffeeBeanventoryModelCopyWith(CoffeeBeanventoryModel value,
          $Res Function(CoffeeBeanventoryModel) then) =
      _$CoffeeBeanventoryModelCopyWithImpl<$Res, CoffeeBeanventoryModel>;
  @useResult
  $Res call({int grams});
}

/// @nodoc
class _$CoffeeBeanventoryModelCopyWithImpl<$Res,
        $Val extends CoffeeBeanventoryModel>
    implements $CoffeeBeanventoryModelCopyWith<$Res> {
  _$CoffeeBeanventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grams = null,
  }) {
    return _then(_value.copyWith(
      grams: null == grams
          ? _value.grams
          : grams // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoffeeBeanventoryModelCopyWith<$Res>
    implements $CoffeeBeanventoryModelCopyWith<$Res> {
  factory _$$_CoffeeBeanventoryModelCopyWith(_$_CoffeeBeanventoryModel value,
          $Res Function(_$_CoffeeBeanventoryModel) then) =
      __$$_CoffeeBeanventoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int grams});
}

/// @nodoc
class __$$_CoffeeBeanventoryModelCopyWithImpl<$Res>
    extends _$CoffeeBeanventoryModelCopyWithImpl<$Res,
        _$_CoffeeBeanventoryModel>
    implements _$$_CoffeeBeanventoryModelCopyWith<$Res> {
  __$$_CoffeeBeanventoryModelCopyWithImpl(_$_CoffeeBeanventoryModel _value,
      $Res Function(_$_CoffeeBeanventoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grams = null,
  }) {
    return _then(_$_CoffeeBeanventoryModel(
      grams: null == grams
          ? _value.grams
          : grams // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CoffeeBeanventoryModel implements _CoffeeBeanventoryModel {
  const _$_CoffeeBeanventoryModel({this.grams = 0});

  @override
  @JsonKey()
  final int grams;

  @override
  String toString() {
    return 'CoffeeBeanventoryModel(grams: $grams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeBeanventoryModel &&
            (identical(other.grams, grams) || other.grams == grams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, grams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoffeeBeanventoryModelCopyWith<_$_CoffeeBeanventoryModel> get copyWith =>
      __$$_CoffeeBeanventoryModelCopyWithImpl<_$_CoffeeBeanventoryModel>(
          this, _$identity);
}

abstract class _CoffeeBeanventoryModel implements CoffeeBeanventoryModel {
  const factory _CoffeeBeanventoryModel({final int grams}) =
      _$_CoffeeBeanventoryModel;

  @override
  int get grams;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeBeanventoryModelCopyWith<_$_CoffeeBeanventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
