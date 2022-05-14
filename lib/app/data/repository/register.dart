import 'package:get/get.dart';

import 'package:codelivery/app/data/model/user.dart';
import 'package:codelivery/app/data/model/order.dart';

import 'package:codelivery/app/data/provider/register_api.dart';

class RegisterRepository {
  final RegisterApiClient apiClient;
  late User user;

  RegisterRepository({required this.apiClient}) {
    initUser();
  }

  initUser() => user = User(nickname: "", address: "", orders: <Order>[]);

  register() {}

  alreadyNickname(String nickname) async =>
      await apiClient.alreadyNickname(nickname);
}
