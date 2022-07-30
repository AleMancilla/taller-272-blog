import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateGroupFirestoreDatasource {
  Future<void> addGroup(GroupModel groupModel) {
    // Call the user's CollectionReference to add a new user
    return groups.add({
      'title': groupModel.title, // Stokes and Sons
      'creationDate': FieldValue.serverTimestamp(),
      'nivelOrdenamiento': groupModel.nivelOrdenamiento
    }).then((value) {
      print("group article Added");
      // print(value);
    }).catchError((error) {
      throw ("Failed to add group article: $error");
    });
  }
}
