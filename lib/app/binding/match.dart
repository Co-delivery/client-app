import 'package:get/get.dart';

import 'package:codelivery/app/controller/match.dart';

import 'package:codelivery/app/data/provider/match_api.dart';
import 'package:codelivery/app/data/repository/match.dart';

class MatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchController(
        repository: MatchRepository(apiClient: MatchApiClient())));
  }
}
