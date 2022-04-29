import 'package:get/get.dart';

import 'package:codelivery/app/route/routes.dart';

import 'package:codelivery/app/ui/accept_match/accpet_match.dart';
import 'package:codelivery/app/ui/home/home.dart';
import 'package:codelivery/app/ui/match/match.dart';

class AppRoutes implements Routes {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => HomePage()),
    GetPage(name: '/accept_match', page: () => AcceptMatchPage()),
    GetPage(name: '/match', page: () => MatchPage()),
  ];
}