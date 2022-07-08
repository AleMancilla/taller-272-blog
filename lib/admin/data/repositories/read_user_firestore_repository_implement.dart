import 'package:blog_taller_base_de_datos/admin/data/datasource/read_user_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/domain/repositories/read_user_firestore_repository.dart';

class ReadUserFirestoreRepositoryImplement
    implements ReadUserFirestoreRepository {
  ReadUserFirestoreDatasource readUserFirestoreDatasource =
      ReadUserFirestoreDatasource();

  @override
  Future<UserModel?> readUser(String user, String pass) async {
    try {
      UserModel? userModel =
          await readUserFirestoreDatasource.readUser(user, pass);
      return userModel;
    } catch (e) {
      return throw '$e';
    }
  }
}
