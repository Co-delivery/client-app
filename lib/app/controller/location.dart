import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController get to => Get.find<LocationController>();

  TextEditingController newLocationEditingController = TextEditingController();
}
