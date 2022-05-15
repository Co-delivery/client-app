class Sign {
  late String userId;
  late String password;
  late String address;
  late String token;
  late String nickname;

  Sign({userId, password, address, token, nickname}) {
    this.userId = userId;
    this.password = password;
    this.address = address;
    this.token = token;
    this.nickname = nickname;
  }

  Sign.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    password = json['password'];
    address = json['address'];
    token = json['token'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['password'] = password;
    data['address'] = address;
    data['token'] = token;
    data['nickname'] = nickname;
    return data;
  }
}
