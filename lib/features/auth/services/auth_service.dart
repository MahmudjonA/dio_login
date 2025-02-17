import 'package:dio/dio.dart';
import '../models/auth_model.dart';

class AuthService {
  final Dio dio = Dio();
  final String baseUrl;

  AuthService({required this.baseUrl}) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
      followRedirects: false,
      validateStatus: (status) => status! < 500,
    );
  }

  Future<User?> login(String username, String password,
      {int expiresInMins = 30}) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
          'expiresInMins': expiresInMins,
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        print('Login error: ${response.statusCode} - ${response.data}');
        return null;
      }
    } catch (e) {
      print('Exception during login: $e');
      return null;
    }
  }
}
