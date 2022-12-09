// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      thumbnail: json['thumbnail'] as String? ?? '',
      discount: json['discount'],
      quantity: json['quantity'] as int? ?? 0,
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
      'isChecked': instance.isChecked,
      'discount': instance.discount,
      'quantity': instance.quantity,
    };
