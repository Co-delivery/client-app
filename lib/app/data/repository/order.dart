import 'package:codelivery/app/data/provider/api.dart';

class OrderRepository {
  final ApiClient apiClient;

  OrderRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }

  postAll() {
    return apiClient.postAll();
  }
}