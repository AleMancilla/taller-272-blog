import 'package:blog_taller_base_de_datos/admin/data/datasource/create_user_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/domain/repositories/create_user_firestore_repository.dart';

class CreateUserFirestoreRepositoeyImplement
    extends CreateUserFirestoreRepository {
  final CreateUserFirestoreDataSource createUserFirestoreDataSource =
      CreateUserFirestoreDataSource();

  // CreateUserFirestoreRepositoeyImplement(this.createUserFirestoreDataSource);

  @override
  Future createUser(UserModel user) async {
    try {
      await createUserFirestoreDataSource.addUser(user);
    } catch (e) {
      throw 'Error al insertar usuario';
    }
  }
}
