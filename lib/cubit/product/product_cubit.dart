import 'package:bloc/bloc.dart';
import 'package:fe_store/data/models/product_model.dart';
import 'package:fe_store/data/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ProductRepository _productRepository = ProductRepository();

  Future<List<ProductModel>?> getAllProduct() async {
    try {
      emit(ProductLoading());
      var response = await _productRepository.fetchAllProduct();

      response != null
          ? emit(ProductSuccess(response))
          : emit(ProductEror(erorText: "Fail get list product"));
    } catch (eror) {
      emit(ProductEror(erorText: eror.toString()));
    }
    return [];
  }
}
