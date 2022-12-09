import 'package:bantu_rafi/features/cart/data/model/meta.dart';

class Failure {
  int code;
  String status;
  String message;

  Failure({required this.code, required this.status, required this.message});
  factory Failure.fromMeta(Meta meta) {
    return Failure(
      code: meta.code,
      status: meta.status,
      message: meta.message,
    );
  }
}
