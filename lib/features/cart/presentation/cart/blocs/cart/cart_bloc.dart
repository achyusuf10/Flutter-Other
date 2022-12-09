import 'dart:async';
import 'package:bantu_rafi/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:bantu_rafi/features/cart/data/model/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/list_cart_res/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<OnStarted>(_onStarted);
    on<AddCart>(_onAddCart);
    on<SubtractCart>(_onSubtractCart);
    on<RemoveCart>(_onRemoveCart);
    on<ToogleCheckBox>(_onToogleCheckBox);
  }

  double _calculateTotalPembayaran(List<Cart> listCart) {
    double total = 0;
    for (var element in listCart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  FutureOr<void> _onStarted(event, emit) async {
    emit(CartLoading());
    var result = await CartRemoteDataSource.fetchAllCart();
    result.fold((l) {
      emit(CartError(l));
    }, (r) {
      emit(
        CartSuccess(
          listCart: r,
          totalPembayaran: _calculateTotalPembayaran(r),
        ),
      );
    });
  }

  FutureOr<void> _onAddCart(event, emit) async {
    event as AddCart;
    var tempList = (state as CartSuccess).listCart;
    var result = await CartRemoteDataSource.addToChart();
    result.fold((l) {
      emit(CartError(l));
    }, (r) {
      tempList
          .singleWhere(
            (element) => element.id == event.cart.id,
          )
          .quantity++;
      emit(
        CartSuccess(
          listCart: tempList,
          totalPembayaran: _calculateTotalPembayaran(tempList),
        ),
      );
    });
  }

  FutureOr<void> _onSubtractCart(event, emit) async {
    event as SubtractCart;
    var tempList = (state as CartSuccess).listCart;
    int index = tempList.indexWhere(
      (element) => element.id == event.cart.id,
    );
    int curQuantity = tempList[index].quantity;

    /// Kalau Quantity nya 1 kemudian di klik subtract, maka akan di remove
    var result = (curQuantity == 1)
        ? await CartRemoteDataSource.remove()
        : await CartRemoteDataSource.subtract();
    result.fold((l) {
      emit(CartError(l));
    }, (r) {
      if (index == -1) return;
      if (tempList[index].quantity == 1) {
        tempList.removeAt(index);
      } else {
        tempList[index].quantity = tempList[index].quantity - 1;
      }

      emit(
        CartSuccess(
          listCart: tempList,
          totalPembayaran: _calculateTotalPembayaran(tempList),
        ),
      );
    });
  }

  FutureOr<void> _onRemoveCart(event, emit) async {
    event as RemoveCart;
    var tempList = (state as CartSuccess).listCart;
    var result = await CartRemoteDataSource.addToChart();
    result.fold((l) {
      emit(
        CartError(l),
      );
    }, (r) {
      tempList.removeWhere(
        (element) => element.id == event.cart.id,
      );
      emit(
        CartSuccess(
          listCart: tempList,
          totalPembayaran: _calculateTotalPembayaran(tempList),
        ),
      );
    });
  }

  FutureOr<void> _onToogleCheckBox(event, emit) async {
    event as ToogleCheckBox;
    var tempList = (state as CartSuccess).listCart;
    int index = tempList.indexWhere((element) => element.id == event.cart.id);

    if (index == -1) return;
    tempList[index].isChecked = !tempList[index].isChecked;
    emit(CartSuccess(
        listCart: tempList,
        totalPembayaran: _calculateTotalPembayaran(tempList)));
  }
}
