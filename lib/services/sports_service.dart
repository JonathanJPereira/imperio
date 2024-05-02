import 'package:dio/dio.dart';
import 'package:imperio/models/sport.dart';

class SportsService {
  final Dio _dio;

  SportsService(this._dio);

  Future<List<Sport>> fetchSports() async {
    try {
      final response =
          await _dio.get('https://6569cc7dde53105b0dd7af5c.mockapi.io/sports');
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
