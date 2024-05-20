import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/bet.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/models/match_conflict.dart';
import 'package:imperio/models/odd_match.dart';

class MatchesService {
  final Dio _dio;

  MatchesService(this._dio);

  Future<List<Match>> fetchMatches() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/matches');
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

  Future<List<Bet>> fetchBets(String matchId) async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/matches/$matchId/bets');
      List<Bet> bets = (response.data as List)
          .map((item) => Bet.fromJson(item as Map<String, dynamic>))
          .toList();
      return bets;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load bets');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }

  Future<List<MatchConflict>> fetchMatchConflicts(String matchId) async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/matches/$matchId/last_matches');
      List<MatchConflict> conflicts = (response.data as List)
          .map((item) => MatchConflict.fromJson(item as Map<String, dynamic>))
          .toList();
      return conflicts;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load match conflicts');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }

  Future<List<OddMatch>> fetchOddsMatches(String matchId) async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/matches/$matchId/odds');
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
