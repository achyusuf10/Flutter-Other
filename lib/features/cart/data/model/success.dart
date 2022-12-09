import 'package:bantu_rafi/features/cart/data/model/meta.dart';

class Success {
  int code;
  String status;
  String message;

  Success({required this.code, required this.status, required this.message});
  factory Success.fromMeta(Meta meta) {
    return Success(
      code: meta.code,
      status: meta.status,
      message: meta.message,
    );
  }
}
