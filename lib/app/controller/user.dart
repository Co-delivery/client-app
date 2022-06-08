import 'package:codelivery/app/data/repository/user.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/data/model/user.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();
  final UserRepository repository;

  UserController({required this.repository});

  late Rx<User> _user;

  get user => _user.value;

  set user(value) => _user.value = value;

  initUser(Rx<User> user) => _user = user;

  Future<bool> updateAddress(String address) async {
    final result = await repository.updateAddress(user.userId, address);

    if (result == null) {
      return false;
    } else {
      _user.value.userId = result['userId']!;
      _user.value.address = result['address']!;

      _user.refresh();

      return true;
    }
  }
}
