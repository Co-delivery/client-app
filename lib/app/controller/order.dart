import 'package:get/get.dart';

import 'package:codelivery/app/data/model/restaurant.dart';
import 'package:codelivery/app/data/model/menu.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find<OrderController>();

  Restaurant? orderRestaurant = null;

  final RxList<Rx<Menu>> _orderList = List<Rx<Menu>>.empty(growable: true).obs;
  final RxList<bool> _enableSubMenuAmountList =
      List<bool>.empty(growable: true).obs;
  final RxList<bool> _enableAddMenuAmountList =
      List<bool>.empty(growable: true).obs;
  final RxList<String> _receiveDeliveryList = <String>["배달", "공동배달", "포장"].obs;
  final RxString _receiveDelivery = "배달".obs;
  final RxInt _expectedPrice = 0.obs;

  get orderList => _orderList.value;

  set orderList(value) => _orderList.value = value;

  get enableSubMenuAmountList => _enableSubMenuAmountList.value;

  set enableSubMenuAmountList(value) => _enableSubMenuAmountList.value = value;

  get enableAddMenuAmountList => _enableAddMenuAmountList.value;

  set enableAddMenuAmountList(value) => _enableAddMenuAmountList.value = value;

  get receiveDeliveryList => _receiveDeliveryList.value;

  set receiveDeliveryList(value) => _receiveDeliveryList.value = value;

  get receiveDelivery => _receiveDelivery.value;

  set receiveDelivery(value) => _receiveDelivery.value = value;

  get expectedPrice => _expectedPrice.value;

  set expectedPrice(value) => _expectedPrice.value = value;

  subMenuAmount(int index) {
    if (orderList[index].amount != 1) {
      orderList[index].amount -= 1;
      expectedPrice -= orderList[index].price;
      if (orderList[index].amount < 10) {
        enableAddMenuAmountList[index] = true;
      }
      if (orderList[index].amount == 1) {
        enableSubMenuAmountList[index] = false;
      }
      _orderList.refresh();
    }
  }

  addMenuAmount(int index) {
    if (orderList[index].amount != 10) {
      orderList[index].amount += 1;
      expectedPrice += orderList[index].price;
      if (orderList[index].amount > 1) {
        enableSubMenuAmountList[index] = true;
      }
      if (orderList[index].amount == 10) {
        enableAddMenuAmountList[index] = false;
      }
      _orderList.refresh();
    }
  }

  addMenu(Rx<Menu> menu, bool enableSubMenuAmount, bool enableAddMenuAmount) {
    if (expectedPrice == 0) {
      expectedPrice += orderRestaurant?.minDeliveryTip;
    }
    orderList.add(menu);
    print(orderList.first);
    enableSubMenuAmountList.add(enableSubMenuAmount);
    enableAddMenuAmountList.add(enableAddMenuAmount);
    expectedPrice += (menu.value.price * menu.value.amount);

    _orderList.refresh();
    _expectedPrice.refresh();
  }

  updateMenu(Menu menu, bool enableSubMenuAmount, bool enableAddMenuAmount) {
    int index = orderList.indexWhere((item) => item.value.name == menu.name);
    orderList[index].value.amount += menu.amount;
    enableSubMenuAmountList[index] = enableSubMenuAmount;
    enableAddMenuAmountList[index] = enableAddMenuAmount;
    expectedPrice += (menu.price * menu.amount);

    orderList[index].refresh();
    _orderList.refresh();
    _expectedPrice.refresh();
  }

  deleteMenu(int index) => orderList.removeAt(index);

  selectReceiveDelivery(int index) =>
      receiveDelivery = receiveDeliveryList[index];
}
