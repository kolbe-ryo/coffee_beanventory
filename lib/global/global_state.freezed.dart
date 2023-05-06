// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalState {
  ColorIndexEnum get colorIndex => throw _privateConstructorUsedError;
  int get beanGrams => throw _privateConstructorUsedError;
  int get beanStockMax => throw _privateConstructorUsedError;
  int get beanAddMax => throw _privateConstructorUsedError;
  int get addBeans => throw _privateConstructorUsedError;
  int get useBeans => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalStateCopyWith<GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<$Res> {
  factory $GlobalStateCopyWith(
          GlobalState value, $Res Function(GlobalState) then) =
      _$GlobalStateCopyWithImpl<$Res, GlobalState>;
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
class _$GlobalStateCopyWithImpl<$Res, $Val extends GlobalState>
    implements $GlobalStateCopyWith<$Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_GlobalStateCopyWith<$Res>
    implements $GlobalStateCopyWith<$Res> {
  factory _$$_GlobalStateCopyWith(
          _$_GlobalState value, $Res Function(_$_GlobalState) then) =
      __$$_GlobalStateCopyWithImpl<$Res>;
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
class __$$_GlobalStateCopyWithImpl<$Res>
    extends _$GlobalStateCopyWithImpl<$Res, _$_GlobalState>
    implements _$$_GlobalStateCopyWith<$Res> {
  __$$_GlobalStateCopyWithImpl(
      _$_GlobalState _value, $Res Function(_$_GlobalState) _then)
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
    return _then(_$_GlobalState(
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

class _$_GlobalState implements _GlobalState {
  const _$_GlobalState(
      {this.colorIndex = ColorIndexEnum.warm,
      this.beanGrams = 0,
      this.beanStockMax = 0,
      this.beanAddMax = 0,
      this.addBeans = 0,
      this.useBeans = 0});

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
    return 'GlobalState(colorIndex: $colorIndex, beanGrams: $beanGrams, beanStockMax: $beanStockMax, beanAddMax: $beanAddMax, addBeans: $addBeans, useBeans: $useBeans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalState &&
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

  @override
  int get hashCode => Object.hash(runtimeType, colorIndex, beanGrams,
      beanStockMax, beanAddMax, addBeans, useBeans);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      __$$_GlobalStateCopyWithImpl<_$_GlobalState>(this, _$identity);
}

abstract class _GlobalState implements GlobalState {
  const factory _GlobalState(
      {final ColorIndexEnum colorIndex,
      final int beanGrams,
      final int beanStockMax,
      final int beanAddMax,
      final int addBeans,
      final int useBeans}) = _$_GlobalState;

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
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}
