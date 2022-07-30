import 'package:blog_taller_base_de_datos/article/data/datasource/create_group_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/article/domain/repositories/create_group_firestore_repository.dart';

class CreateGroupFirestoreRepositoryImplement
    implements CreateGroupFirestoreRepository {
  final CreateGroupFirestoreDatasource createGroupFirestoreDatasource =
      CreateGroupFirestoreDatasource();

  @override
  Future createGroup(GroupModel GroupModel) async {
    try {
      await createGroupFirestoreDatasource.addGroup(GroupModel);
    } catch (e) {
      throw '$e';
    }
  }
}
