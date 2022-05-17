import 'package:codelivery/app/data/model/menu.dart';

class MenuRepository {
  initMenuList(String restaurantName) {
    for (int i = 0; i < menuList.length; i++) {
      if (menuList[i][0] == restaurantName) {
        List temp = menuList[i];
        List<Menu> result = List<Menu>.empty(growable: true);

        for (var element in temp) {
          switch (element.runtimeType) {
            case Menu:
              {
                result.add(element);
              }
          }
        }

        return result;
      }
    }
  }
}

List menuList = [
  [
    "성호네 스끼야끼",
    Menu(
        title: "차돌탄탄나베",
        description: "바로 드실 수 있게 조리된 상태로 나갑니다.",
        image: "",
        price: 23000,
        amount: 1),
    Menu(
        title: "수제 오코노미야끼",
        description: "모든 재료를 수제로 준비해 철판에 조리합니다.",
        image: "",
        price: 16500,
        amount: 1),
    Menu(
        title: "소고기타다키",
        description: "소스를 소고기와 야채에 뿌려서 드세요~",
        image: "",
        price: 21000,
        amount: 1),
    Menu(title: "나가사끼짬뽕", description: "", image: "", price: 18000, amount: 1)
  ],
  [
    "상진네 쌈밥",
    Menu(
        title: "철판돼지불백쌈밥", description: "", image: "", price: 18000, amount: 1),
    Menu(title: "철판제육쌈밥", description: "", image: "", price: 18000, amount: 1),
    Menu(title: "그릴통삼겹쌈밥", description: "", image: "", price: 26000, amount: 1),
    Menu(
        title: "제육 보리비빔밥(단품)",
        description: "",
        image: "",
        price: 9500,
        amount: 1)
  ],
  [
    "성규네 횟집",
    Menu(title: "광어", description: "", image: "", price: 36000, amount: 1),
    Menu(title: "우럭", description: "", image: "", price: 36000, amount: 1),
    Menu(title: "참돔", description: "", image: "", price: 36000, amount: 1),
    Menu(
        title: "모듬회",
        description: "모둠회는 광어, 우럭, 참동 3종으로 주문됩니다.\n(사진으로 보는 이미지와 다를 수 있습니다.)",
        image: "",
        price: 46000,
        amount: 1)
  ],
  [
    "석주네 중국집",
    Menu(title: "짜장", description: "", image: "", price: 7000, amount: 1),
    Menu(title: "짬뽕", description: "", image: "", price: 9000, amount: 1),
    Menu(title: "찹쌀탕수육", description: "", image: "", price: 16000, amount: 1),
    Menu(title: "새우볶음밥", description: "", image: "", price: 9000, amount: 1)
  ],
  [
    "진이네 떡볶이",
    Menu(title: "떡볶이", description: "", image: "", price: 4000, amount: 1),
    Menu(title: "튀김모듬", description: "", image: "", price: 4500, amount: 1),
    Menu(title: "순대", description: "", image: "", price: 4500, amount: 1),
    Menu(title: "어묵탕", description: "", image: "", price: 4000, amount: 1)
  ]
];
