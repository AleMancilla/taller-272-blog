import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';

abstract class CreateGroupFirestoreRepository {
  Future createGroup(GroupModel groupModel);
}
