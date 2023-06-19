part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel>? productModel;

  ProductSuccess(this.productModel);
}

class ProductEror extends ProductState {
  final String erorText;
  ProductEror({
    required this.erorText,
  });
}
