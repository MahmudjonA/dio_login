import 'package:dio/dio.dart';
import '../model/home_model.dart';

class ProductService {
  final Dio dio = Dio();
  final String baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        List products = response.data['products'];
        return products.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
