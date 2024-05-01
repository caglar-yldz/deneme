import 'dart:convert';

import 'package:frontend/models/login_model.dart';
import 'package:frontend/services/data_source.dart';
import 'package:http/http.dart' as http;

class AppDataSource extends DataSource {
  final String baseUrl = 'http://localhost:7111/';
  Map<String, String> get header => {'Content-Type': 'application/json'};

  @override
  Future login(Login login) async {
    final url = '$baseUrl${'Otp/Generate'}';
    print("a");
    print(login.toJson());
    print(login.toJson());
    print(login.toJson());
    print(login.toJson());

    try {
      print("b");
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(login.toJson()),
      );
      print("c");

      final map = json.decode(response.body);
      print(map);
      print(response);

      print(response);
      if (response.statusCode == 200) {
        print('Kayıt başarılı.');
      } else {
        print(
            'Kayıt sırasında bir hata oluştu. Hata kodu: ${response.statusCode}');
        print('Hata mesajı: ${response.body}');
      }
      //final authResponseModel = AuthResponseModel.fromJson(map);
      return response.body;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
