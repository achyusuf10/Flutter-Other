import 'dart:convert';

import 'package:bantu_rafi/features/cart/data/model/failure.dart';
import 'package:bantu_rafi/features/cart/data/model/list_cart_res/cart.dart';
import 'package:bantu_rafi/features/cart/data/model/list_cart_res/list_cart_res.dart';
import 'package:bantu_rafi/features/cart/data/model/meta.dart';
import 'package:bantu_rafi/features/cart/data/model/success.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

class CartRemoteDataSource {
  /// Untuk Singleton, agar tidak bisa diinisialisasi
  CartRemoteDataSource._();
  static Future<Either<Failure, List<Cart>>> fetchAllCart() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      String response =
          await rootBundle.loadString('assets/json/list_cart.json');
      var listCartRes = ListCartRes.fromJson(jsonDecode(response));
      return Right(listCartRes.dataListCart);
    } catch (e) {
      return Left(
        Failure.fromMeta(
          Meta.failure(),
        ),
      );
    }
  }

  static Future<Either<Failure, Success>> addToChart() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return Right(Success.fromMeta(
        Meta.success('Success'),
      ));
    } catch (e) {
      return Left(
        Failure.fromMeta(
          Meta.failure(),
        ),
      );
    }
  }

  static Future<Either<Failure, Success>> addQuantity() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return Right(Success.fromMeta(
        Meta.success('Success'),
      ));
    } catch (e) {
      return Left(
        Failure.fromMeta(
          Meta.failure(),
        ),
      );
    }
  }

  static Future<Either<Failure, Success>> subtract() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return Right(Success.fromMeta(
        Meta.success('Success'),
      ));
    } catch (e) {
      return Left(
        Failure.fromMeta(
          Meta.failure(),
        ),
      );
    }
  }

  static Future<Either<Failure, Success>> remove() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return Right(Success.fromMeta(
        Meta.success('Success'),
      ));
    } catch (e) {
      return Left(
        Failure.fromMeta(
          Meta.failure(),
        ),
      );
    }
  }
}
