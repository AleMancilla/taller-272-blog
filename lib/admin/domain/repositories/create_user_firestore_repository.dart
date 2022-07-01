import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';

abstract class CreateUserFirestoreRepository {
  Future createUser(UserModel user);
}
