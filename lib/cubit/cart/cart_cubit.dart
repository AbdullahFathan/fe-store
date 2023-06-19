import 'package:bloc/bloc.dart';
import 'package:fe_store/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartList() {
    emit(CartLoading());

    double totalPrice = cartProduct.fold(
        0, (previousValue, element) => previousValue + element.price);
    emit(CartGetList(
      productModel: cartProduct,
      totalPrice: totalPrice,
    ));
  }

  void addItemToCart(ProductModel productModel) {
    cartProduct.add(productModel);
    emit(CartSuccess());
  }

  void removeItemFromCart(ProductModel productModel) {
    cartProduct.remove(productModel);
    emit(CartSuccess());
  }
}
