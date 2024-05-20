import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/bonus/bonus.dart';

class BonusService {
  final Dio _dio;

  BonusService(this._dio);

  Future<List<Bonus>> fetchBonuses() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/bonus');
      List<Bonus> bonuses = (response.data as List)
          .map((dynamic item) => Bonus.fromJson(item as Map<String, dynamic>))
          .toList();
      return bonuses;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load bonuses');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
