import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/tip/tip.dart';

class TipsService {
  final Dio _dio;

  TipsService(this._dio);

  Future<List<Tip>> fetchTips() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/tips');
      List<Tip> tips = (response.data as List)
          .map((dynamic item) => Tip.fromJson(item as Map<String, dynamic>))
          .toList();

      return tips;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load tips');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
