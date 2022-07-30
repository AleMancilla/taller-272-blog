import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';

abstract class ReadGroupFirestoreRepository {
  Future<List<GroupModel>> readListGroup();
}
