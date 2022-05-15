import 'package:codelivery/app/data/model/sign.dart';

import 'package:codelivery/app/data/provider/sign_api.dart';

class SignRepository {
  final SignApiClient apiClient;

  late Sign sign;

  SignRepository({required this.apiClient}) {
    initUser();
  }

  initUser() => sign =
      Sign(userId: "", password: "", nickname: "", address: "", token: "");

  register(data) async => await apiClient.register(data);

  login(data) async => await apiClient.login(data);
}
