import 'package:dio/dio.dart';
import 'package:imperio/models/match.dart';

class MatchesService {
  final Dio _dio;

  MatchesService(this._dio);

  Future<List<Match>> fetchMatches() async {
    try {
      final response =
          await _dio.get('https://6569cc7dde53105b0dd7af5c.mockapi.io/matches');
      List<Match> matches = (response.data as List)
          .map((dynamic item) => Match.fromJson(item as Map<String, dynamic>))
          .toList();
      return matches;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load matches');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
