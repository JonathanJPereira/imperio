import 'package:dio/dio.dart';
import 'package:imperio/models/odd_match.dart';

class OddsMatchesService {
  final Dio _dio;

  OddsMatchesService(this._dio);

  Future<List<OddMatch>> fetchOddsMatches(String matchId) async {
    try {
      final response = await _dio.get(
          'https://6569cc7dde53105b0dd7af5c.mockapi.io/matches/$matchId/odds');
      List<OddMatch> oddsMatches = (response.data as List)
          .map(
              (dynamic item) => OddMatch.fromJson(item as Map<String, dynamic>))
          .toList();
      return oddsMatches;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load odds matches');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
