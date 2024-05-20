import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imperio/models/won_bet/won_bet.dart';

class WonBetsService {
  final Dio _dio;

  WonBetsService(this._dio);

  Future<List<WonBet>> fetchWonBets() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? '';
      final response = await _dio.get('$apiUrl/won_bets');
      List<WonBet> wonBets = (response.data as List)
          .map((dynamic item) => WonBet.fromJson(item as Map<String, dynamic>))
          .toList();
      return wonBets;
    } on DioException catch (e) {
      print(e.message);
      throw Exception('Failed to load won bets');
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
