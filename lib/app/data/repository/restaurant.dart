import 'package:codelivery/app/data/provider/api.dart';

class RestaurantRepository {
  final ApiClient apiClient;

  RestaurantRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }

  postAll() {
    return apiClient.postAll();
  }
}