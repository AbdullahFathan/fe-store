import 'package:dio/dio.dart';
import 'package:fe_store/data/models/product_model.dart';

class ProductRepository {
  final _dio = Dio();

  Future<List<ProductModel>?> fetchAllProduct() async {
    try {
      var response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        List<ProductModel> listProductModel = [];
        for (var data in (response.data as List<dynamic>)) {
          ProductModel productModel = ProductModel.fromJson(data);
          listProductModel.add(productModel);
        }

        return listProductModel;
      }
    } catch (eror) {
      throw Exception('There is eror in fetchAllProduct: ${eror.toString()}');
    }
    return null;
  }

  Future<List<ProductModel>?> fecthProductByCategory(
    String category,
    String limit,
  ) async {
    try {
      var response = await _dio.get(
          'https://fakestoreapi.com/products/category/$category?limit=$limit');

      if (response.statusCode == 200) {
        List<ProductModel> listProductModel = [];
        for (var data in (response.data as List<dynamic>)) {
          ProductModel productModel = ProductModel.fromJson(data);
          listProductModel.add(productModel);
        }

        return listProductModel;
      }
    } catch (eror) {
      throw Exception(
          'There is eror in fecthProductCategory: ${eror.toString()}');
    }
    return null;
  }
}
