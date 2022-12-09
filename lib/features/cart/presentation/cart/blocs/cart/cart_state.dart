part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartInitial extends CartState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartSuccess extends CartState {
  final List<Cart> listCart;
  final double totalPembayaran;
  CartSuccess({required this.listCart, required this.totalPembayaran});
  @override
  List<Object?> get props => [listCart, totalPembayaran];
}

class CartError extends CartState {
  final Failure failure;

  CartError(this.failure);
  @override
  List<Object?> get props => [failure];
}
