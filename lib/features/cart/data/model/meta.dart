import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  @JsonKey(defaultValue: 400)
  int code;
  @JsonKey(defaultValue: 'Failed')
  String status;
  @JsonKey(defaultValue: 'Terjadi kesalahan')
  String message;

  Meta({required this.code, required this.status, required this.message});

  factory Meta.failure() => Meta(
        code: 400,
        status: 'Error',
        message: 'Terjadi Keslahan',
      );
  factory Meta.success(String message) => Meta(
        code: 200,
        status: 'Success',
        message: message,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
