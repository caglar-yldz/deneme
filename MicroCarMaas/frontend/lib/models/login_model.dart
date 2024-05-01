class Login {
  String? phoneNumber;

  Login({this.phoneNumber});

  Login.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
