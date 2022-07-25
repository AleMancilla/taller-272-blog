import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadUserListFirestoreDatasource {
  Future<List<UserModel?>> readUserList() async {
    List<UserModel> listUser = [];
    await users.get().then(
      (QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          try {
            Map _json = (doc.data() as Map);
            UserModel userModel = UserModel(
              user: _json['user'],
              pass: _json['pass'],
              level: _json['level'],
              idUser: _json['idUser'],
              name: _json['name'],
              photo: _json['photo'],
              work: _json['work'],
              description: _json['description'],
              contact: _json['contact'],
              activate: _json['activate'],
              dateCreate: _json['dateCreate'] != null
                  ? DateTime.parse(
                      (_json['dateCreate'] as Timestamp).toDate().toString())
                  : null,
            );
            listUser.add(userModel);
          } catch (e) {
            throw 'Error de lectura: $e';
          }
        }
      },
    ).catchError((error) {
      return throw 'Error al buscar al usuario: $error';
    });
    return listUser;
  }

  // Map<String, dynamic> convertToMapFromObject(Object? object) {
  //   try {
  //     String item = json.encode(object);
  //     Map<String, dynamic> valueMap = json.decode(item);
  //     return valueMap;
  //   } catch (e) {
  //     return throw 'Data Firestore not convert';
  //   }
  // }
}
