class User {
    String? phoneNumber;

    User({this.phoneNumber}); 

    User.fromJson(Map<String, dynamic> json) {
        phoneNumber = json['phoneNumber'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['phoneNumber'] = phoneNumber;
        return data;
    }
}


