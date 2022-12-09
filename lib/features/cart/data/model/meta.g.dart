// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      code: json['code'] as int? ?? 400,
      status: json['status'] as String? ?? 'Failed',
      message: json['message'] as String? ?? 'Terjadi kesalahan',
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
    };
