import 'package:codelivery/app/binding/dialog.dart';
import 'package:codelivery/app/binding/location.dart';
import 'package:codelivery/app/binding/match.dart';
import 'package:codelivery/app/binding/payment.dart';

import 'package:codelivery/app/ui/middle_point/components/chat_web_view.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/route/routes.dart';

// sign
import 'package:codelivery/app/binding/getting_started.dart';
import 'package:codelivery/app/binding/fcm.dart';
import 'package:codelivery/app/binding/user.dart';

// home
import 'package:codelivery/app/binding/order.dart';
import 'package:codelivery/app/binding/restaurant.dart';

// sign
import 'package:codelivery/app/ui/getting_started/getting_started.dart';
import 'package:codelivery/app/ui/sign/sign.dart';
import 'package:codelivery/app/ui/accept_match/accept_match.dart';

// home
import 'package:codelivery/app/ui/home/home.dart';
import 'package:codelivery/app/ui/order_basket/order_basket.dart';
import 'package:codelivery/app/ui/match/match.dart';
import 'package:codelivery/app/ui/restaurant_detail/restaurant_detail.dart';
import 'package:codelivery/app/ui/menu_detail/menu_detail.dart';
import 'package:codelivery/app/ui/middle_point/middle_point.dart';

import '../ui/middle_point/components/order_bill.dart';
import '../ui/order_bill/order_bill.dart';

class AppRoutes implements Routes {
  static final routes = [
    // Register pages
    GetPage(
        name: Routes.INITIAL,
        page: () => GettingStartedPage(),
        bindings: [GettingStartedBinding(), FcmBinding(), DialogBinding()]),
    GetPage(name: '/sign', page: () => SignPage(), bindings: [UserBinding()]),
    GetPage(
        name: '/home',
        page: () => HomePage(),
        bindings: [RestaurantBinding(), OrderBinding(), LocationBinding()]),
    GetPage(
      name: '/order_basket',
      page: () => OrderBasketPage(),
    ),
    GetPage(name: '/restaurant_detail', page: () => RestaurantDetailPage()),
    GetPage(
        name: '/restaurant_detail/menu_detail', page: () => MenuDetailPage()),
    GetPage(
        name: '/match', page: () => MatchPage(), bindings: [MatchBinding()]),
    GetPage(
        name: '/match/accept_match',
        page: () => AcceptMatchPage(),
        bindings: [PaymentBinding()]),
    GetPage(
        name: '/match/order_bill',
        page: () => OrderBillPage(),
        bindings: [PaymentBinding()]),
    GetPage(name: '/match/middle_point', page: () => MiddlePointPage()),
    GetPage(name: '/match/middle_point/chat', page: () => ChatWebView()),
    GetPage(name: '/match/middle_point/bill', page: () => OrderBill())
  ];
}
