import 'package:blog_taller_base_de_datos/article/data/datasource/read_groups_firestore_datasources.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/article/domain/repositories/read_group_firestore_repository.dart';

class ReadListGroupFirestoreRepositoryImplements
    implements ReadGroupFirestoreRepository {
  final ReadGroupsFirestoreDatasource readGroupFirestoreDatasource =
      ReadGroupsFirestoreDatasource();

  @override
  Future<List<GroupModel>> readListGroup() {
    try {
      return readGroupFirestoreDatasource.readGroups();
    } catch (e) {
      throw '$e';
    }
  }
}
