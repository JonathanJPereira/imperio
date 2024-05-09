import 'package:dio/dio.dart';
import 'package:imperio/models/bonus.dart';

class BonusService {
  final Dio _dio;

  BonusService(this._dio);

  Future<List<Bonus>> fetchBonuses() async {
    try {
      final response =
          await _dio.get('https://6569cc7dde53105b0dd7af5c.mockapi.io/bonus');
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
