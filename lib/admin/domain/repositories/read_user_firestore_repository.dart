import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';

abstract class ReadUserFirestoreRepository {
  Future<UserModel?> readUser(String user, String pass);
}
