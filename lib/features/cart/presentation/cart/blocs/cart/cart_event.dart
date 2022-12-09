part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

/// Untuk Mendapatkan Data Cart Pertama Kali
class OnStarted extends CartEvent {
  @override
  List<Object?> get props => [];
}

/// Untuk Menambah Quantity Pada item Cart
class AddCart extends CartEvent {
  final Cart cart;

  AddCart(this.cart);

  @override
  List<Object?> get props => [cart];
}

/// Untuk Mengurangi Quantity pada item cart
class SubtractCart extends CartEvent {
  final Cart cart;

  SubtractCart(this.cart);

  @override
  List<Object?> get props => [cart];
}

/// Untuk Menghapus Item Cart
class RemoveCart extends CartEvent {
  final Cart cart;

  RemoveCart(this.cart);

  @override
  List<Object?> get props => [cart];
}

/// Untuk Menghapus Item Cart
class ToogleCheckBox extends CartEvent {
  final Cart cart;

  ToogleCheckBox(this.cart);

  @override
  List<Object?> get props => [cart];
}
