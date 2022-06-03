import 'package:codelivery/app/data/provider/match_api.dart';

class MatchRepository {
  final MatchApiClient apiClient;

  MatchRepository({required this.apiClient});

  Future<Map<String, dynamic>> requestMatch(Map<String, dynamic> data) async =>
      await apiClient.requestMatch(data);

  Future<Map<String, dynamic>> cancelMatch(String nickname) async {
    Map<String, dynamic> data = {'nickname': nickname};
    return await apiClient.cancelMatch(data);
  }

  Future<Map<String, dynamic>> acceptMatch(Map<String, dynamic> data) async =>
      await apiClient.acceptMatch(data);
}
