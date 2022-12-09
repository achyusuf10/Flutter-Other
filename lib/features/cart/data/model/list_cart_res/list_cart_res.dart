import 'package:json_annotation/json_annotation.dart';

import 'cart.dart';
import '../meta.dart';

part 'list_cart_res.g.dart';

@JsonSerializable()
class ListCartRes {
  Meta meta;
  @JsonKey(name: 'data', defaultValue: [])
  List<Cart> dataListCart;

  ListCartRes({required this.meta, required this.dataListCart});

  factory ListCartRes.fromJson(Map<String, dynamic> json) {
    return _$ListCartResFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListCartResToJson(this);
}
