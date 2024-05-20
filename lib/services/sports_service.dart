import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/sport/sport.dart';

class SportsService {
  final Dio _dio;

  SportsService(this._dio);

  Future<List<Sport>> fetchSports() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/sports');
      List<Sport> sports = (response.data as List)
          .map((dynamic item) => Sport.fromJson(item as Map<String, dynamic>))
          .toList();
      return sports;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load sports');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
