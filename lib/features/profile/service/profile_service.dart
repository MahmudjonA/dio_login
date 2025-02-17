import 'package:dio/dio.dart';
import '../model/profile_model.dart';

class ProfileService {
  final Dio dio = Dio();
  final String baseUrl = 'https://dummyjson.com';

  Future<AllInfo?> fetchProfile(String accessToken) async {
    try {
      final response = await dio.get(
        '$baseUrl/auth/me',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      if (response.statusCode == 200) {
        return AllInfo.fromJson(response.data);
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      return null;
    }
  }
}
