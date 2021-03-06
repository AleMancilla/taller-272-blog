import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUserFirestoreDataSource {
  Future<void> addUser(UserModel userModel) {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'user': userModel.user, // John Doe
      'pass': userModel.pass, // Stokes and Sons
      'level': userModel.level, // 42
      'name': userModel.name,
      'creationDate': FieldValue.serverTimestamp(),
      'urlPhoto': userModel.photo,
      'description': userModel.description,
      'contact': userModel.contact,
      'statusActivate': userModel.activate
    }).then((value) {
      print("User Added");
      // print(value);
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }
}
