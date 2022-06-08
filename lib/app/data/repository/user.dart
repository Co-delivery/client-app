import 'package:codelivery/app/data/provider/user_api.dart';

class UserRepository {
  final UserApiClient apiClient;

  UserRepository({required this.apiClient});

  Future<Map<String, String>?> updateAddress(
      String userId, String address) async {
    Map<String, String> data = {'userId': userId, 'address': address};

    final result = await apiClient.updateAddress(data);

    if (result['httpStatus'] == 200) {
      return {
        'userId': result['data']['userId'],
        'address': result['data']['address']
      };
    } else {
      return null;
    }
  }
}
