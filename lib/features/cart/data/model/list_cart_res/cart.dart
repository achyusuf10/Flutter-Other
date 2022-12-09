import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: 0)
  int price;
  @JsonKey(defaultValue: '')
  String thumbnail;
  @JsonKey(defaultValue: false)
  bool isChecked;

  dynamic discount;
  @JsonKey(defaultValue: 0)
  int quantity;

  Cart({
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.discount,
    required this.quantity,
    required this.isChecked,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
