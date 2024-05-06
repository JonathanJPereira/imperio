import 'package:dio/dio.dart';
import 'package:imperio/models/tip.dart';

class TipsService {
  final Dio _dio;

  TipsService(this._dio);

  Future<List<Tip>> fetchTips() async {
    try {
      final response =
          await _dio.get('https://6569cc7dde53105b0dd7af5c.mockapi.io/tips');
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
