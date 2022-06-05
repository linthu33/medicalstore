part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded({required this.cart});

  final CartModel cart;

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
