import 'package:codelivery/app/data/provider/api.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }

  postAll() {
    return apiClient.postAll();
  }
}