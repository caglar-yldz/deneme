import 'package:frontend/models/login_model.dart';
import 'package:frontend/models/user_model.dart';

abstract class DataSource {
  Future login(Login login);
}
