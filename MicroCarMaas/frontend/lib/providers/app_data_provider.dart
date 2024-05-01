import 'package:flutter/material.dart';
import 'package:frontend/models/login_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/services/app_data_source.dart';
import 'package:frontend/services/data_source.dart';
import 'package:frontend/utils/helper_function.dart';

class AppDataProvider extends ChangeNotifier {
  final DataSource _dataSource = AppDataSource();


  Future login(Login login) async {
    final response = await _dataSource.login(login);
    if (response == null) return null;
    await saveToken(response.accessToken);
    await saveExpirationDuration(response.expirationDuration);
    return response;
  }
}
