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

CoffeeBeanventoryModel _$CoffeeBeanventoryModelFromJson(
    Map<String, dynamic> json) {
  return _CoffeeBeanventoryModel.fromJson(json);
}

/// @nodoc
mixin _$CoffeeBeanventoryModel {
  ColorIndexEnum get colorIndex => throw _privateConstructorUsedError;
  int get beanGrams => throw _privateConstructorUsedError;
  int get beanStockMax => throw _privateConstructorUsedError;
  int get beanAddMax => throw _privateConstructorUsedError;
  int get addBeans => throw _privateConstructorUsedError;
  int get useBeans => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
  $Res call(
      {ColorIndexEnum colorIndex,
      int beanGrams,
      int beanStockMax,
      int beanAddMax,
      int addBeans,
      int useBeans});
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
    Object? colorIndex = null,
    Object? beanGrams = null,
    Object? beanStockMax = null,
    Object? beanAddMax = null,
    Object? addBeans = null,
    Object? useBeans = null,
  }) {
    return _then(_value.copyWith(
      colorIndex: null == colorIndex
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as ColorIndexEnum,
      beanGrams: null == beanGrams
          ? _value.beanGrams
          : beanGrams // ignore: cast_nullable_to_non_nullable
              as int,
      beanStockMax: null == beanStockMax
          ? _value.beanStockMax
          : beanStockMax // ignore: cast_nullable_to_non_nullable
              as int,
      beanAddMax: null == beanAddMax
          ? _value.beanAddMax
          : beanAddMax // ignore: cast_nullable_to_non_nullable
              as int,
      addBeans: null == addBeans
          ? _value.addBeans
          : addBeans // ignore: cast_nullable_to_non_nullable
              as int,
      useBeans: null == useBeans
          ? _value.useBeans
          : useBeans // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {ColorIndexEnum colorIndex,
      int beanGrams,
      int beanStockMax,
      int beanAddMax,
      int addBeans,
      int useBeans});
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
    Object? colorIndex = null,
    Object? beanGrams = null,
    Object? beanStockMax = null,
    Object? beanAddMax = null,
    Object? addBeans = null,
    Object? useBeans = null,
  }) {
    return _then(_$_CoffeeBeanventoryModel(
      colorIndex: null == colorIndex
          ? _value.colorIndex
          : colorIndex // ignore: cast_nullable_to_non_nullable
              as ColorIndexEnum,
      beanGrams: null == beanGrams
          ? _value.beanGrams
          : beanGrams // ignore: cast_nullable_to_non_nullable
              as int,
      beanStockMax: null == beanStockMax
          ? _value.beanStockMax
          : beanStockMax // ignore: cast_nullable_to_non_nullable
              as int,
      beanAddMax: null == beanAddMax
          ? _value.beanAddMax
          : beanAddMax // ignore: cast_nullable_to_non_nullable
              as int,
      addBeans: null == addBeans
          ? _value.addBeans
          : addBeans // ignore: cast_nullable_to_non_nullable
              as int,
      useBeans: null == useBeans
          ? _value.useBeans
          : useBeans // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoffeeBeanventoryModel implements _CoffeeBeanventoryModel {
  _$_CoffeeBeanventoryModel(
      {this.colorIndex = ColorIndexEnum.warm,
      this.beanGrams = 0,
      this.beanStockMax = 0,
      this.beanAddMax = 0,
      this.addBeans = 0,
      this.useBeans = 0});

  factory _$_CoffeeBeanventoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoffeeBeanventoryModelFromJson(json);

  @override
  @JsonKey()
  final ColorIndexEnum colorIndex;
  @override
  @JsonKey()
  final int beanGrams;
  @override
  @JsonKey()
  final int beanStockMax;
  @override
  @JsonKey()
  final int beanAddMax;
  @override
  @JsonKey()
  final int addBeans;
  @override
  @JsonKey()
  final int useBeans;

  @override
  String toString() {
    return 'CoffeeBeanventoryModel(colorIndex: $colorIndex, beanGrams: $beanGrams, beanStockMax: $beanStockMax, beanAddMax: $beanAddMax, addBeans: $addBeans, useBeans: $useBeans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeBeanventoryModel &&
            (identical(other.colorIndex, colorIndex) ||
                other.colorIndex == colorIndex) &&
            (identical(other.beanGrams, beanGrams) ||
                other.beanGrams == beanGrams) &&
            (identical(other.beanStockMax, beanStockMax) ||
                other.beanStockMax == beanStockMax) &&
            (identical(other.beanAddMax, beanAddMax) ||
                other.beanAddMax == beanAddMax) &&
            (identical(other.addBeans, addBeans) ||
                other.addBeans == addBeans) &&
            (identical(other.useBeans, useBeans) ||
                other.useBeans == useBeans));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, colorIndex, beanGrams,
      beanStockMax, beanAddMax, addBeans, useBeans);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoffeeBeanventoryModelCopyWith<_$_CoffeeBeanventoryModel> get copyWith =>
      __$$_CoffeeBeanventoryModelCopyWithImpl<_$_CoffeeBeanventoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoffeeBeanventoryModelToJson(
      this,
    );
  }
}

abstract class _CoffeeBeanventoryModel implements CoffeeBeanventoryModel {
  factory _CoffeeBeanventoryModel(
      {final ColorIndexEnum colorIndex,
      final int beanGrams,
      final int beanStockMax,
      final int beanAddMax,
      final int addBeans,
      final int useBeans}) = _$_CoffeeBeanventoryModel;

  factory _CoffeeBeanventoryModel.fromJson(Map<String, dynamic> json) =
      _$_CoffeeBeanventoryModel.fromJson;

  @override
  ColorIndexEnum get colorIndex;
  @override
  int get beanGrams;
  @override
  int get beanStockMax;
  @override
  int get beanAddMax;
  @override
  int get addBeans;
  @override
  int get useBeans;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeBeanventoryModelCopyWith<_$_CoffeeBeanventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
