import 'package:get/get.dart';

import 'package:codelivery/app/controller/menu.dart';
import 'package:codelivery/app/data/repository/menu.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    MenuController(repository: MenuRepository());
  }
}