import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/championship/championship.dart';

class ChampionshipsService {
  final Dio _dio;

  ChampionshipsService(this._dio);

  Future<List<Championship>> fetchChampionships() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/championships');
      List<Championship> championships = (response.data as List)
          .map((dynamic item) =>
              Championship.fromJson(item as Map<String, dynamic>))
          .toList();

      return championships;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load championships');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
