import 'package:codelivery/app/binding/fcm.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/route/routes.dart';

import 'package:codelivery/app/binding/getting_started.dart';
import 'package:codelivery/app/binding/fcm.dart';

import 'package:codelivery/app/ui/getting_started/getting_started.dart';
import 'package:codelivery/app/ui/sign/sign.dart';
import 'package:codelivery/app/ui/accept_match/accpet_match.dart';
import 'package:codelivery/app/ui/home/home.dart';
import 'package:codelivery/app/ui/match/match.dart';

class AppRoutes implements Routes {
  static final routes = [
    // Register pages
    GetPage(
        name: Routes.INITIAL,
        page: () => GettingStartedPage(),
        bindings: [GettingStartedBinding(), FcmBinding()]),
    GetPage(name: '/sign', page: () => SignPage()),
    GetPage(name: '/accept_match', page: () => AcceptMatchPage()),
    GetPage(name: '/match', page: () => MatchPage()),
  ];
}
