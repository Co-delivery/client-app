class Menu {
  late String name;
  late String description;
  late String image;
  late int price;
  late int amount;

  Menu({name, description, image, price, amount}) {
    this.name = name;
    this.description = description;
    this.image = image;
    this.price = price;
    this.amount = amount;
  }

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['amount'] = amount;
    return data;
  }
}
