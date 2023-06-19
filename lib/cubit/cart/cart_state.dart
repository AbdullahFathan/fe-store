part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess extends CartState {}

class CartLoading extends CartState {}

class CartGetList extends CartState {
  final List<ProductModel> productModel;
  final double totalPrice;
  CartGetList({
    required this.productModel,
    required this.totalPrice,
  });
}
