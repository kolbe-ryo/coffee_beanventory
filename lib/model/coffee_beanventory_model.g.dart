// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_beanventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoffeeBeanventoryModel _$$_CoffeeBeanventoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_CoffeeBeanventoryModel(
      colorIndex:
          $enumDecodeNullable(_$ColorIndexEnumEnumMap, json['colorIndex']) ??
              ColorIndexEnum.warm,
      coffeeName: json['coffeeName'] as String? ?? 'Coffee Name',
      beanGrams: json['beanGrams'] as int? ?? 0,
      beanStockMax: json['beanStockMax'] as int? ?? 100,
      beanAddMax: json['beanAddMax'] as int? ?? 100,
      addBeans: json['addBeans'] as int? ?? 0,
      useBeans: json['useBeans'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CoffeeBeanventoryModelToJson(
        _$_CoffeeBeanventoryModel instance) =>
    <String, dynamic>{
      'colorIndex': _$ColorIndexEnumEnumMap[instance.colorIndex]!,
      'coffeeName': instance.coffeeName,
      'beanGrams': instance.beanGrams,
      'beanStockMax': instance.beanStockMax,
      'beanAddMax': instance.beanAddMax,
      'addBeans': instance.addBeans,
      'useBeans': instance.useBeans,
    };

const _$ColorIndexEnumEnumMap = {
  ColorIndexEnum.warm: 'warm',
  ColorIndexEnum.cold: 'cold',
};
