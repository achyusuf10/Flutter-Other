// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_cart_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCartRes _$ListCartResFromJson(Map<String, dynamic> json) => ListCartRes(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      dataListCart: (json['data'] as List<dynamic>?)
              ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ListCartResToJson(ListCartRes instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.dataListCart,
    };
