import 'package:dio/dio.dart';

import '../model/product_model.dart';

class ProductService {
  final Dio dio = Dio();
  final String baseUrl = 'https://dummyjson.com';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get('$baseUrl/products');
      if (response.statusCode == 200) {
        final List<dynamic> productList = response.data['products'];
        return productList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Error loading data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
