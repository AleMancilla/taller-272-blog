import 'package:blog_taller_base_de_datos/admin/data/datasource/read_user_list_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/domain/repositories/read_list_user_firestore_repository.dart';

class ReadUserListFirestoreRepositoryImplement
    implements ReadUserListFirestoreRepository {
  ReadUserListFirestoreDatasource readUserListFirestoreDatasource =
      ReadUserListFirestoreDatasource();

  @override
  Future<List<UserModel?>> readListUser() async {
    try {
      List<UserModel?> userModel =
          await readUserListFirestoreDatasource.readUserList();
      return userModel;
    } catch (e) {
      return throw '$e';
    }
  }
}
