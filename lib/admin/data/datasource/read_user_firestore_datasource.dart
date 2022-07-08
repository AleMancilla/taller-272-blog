import 'dart:convert';
import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';

class ReadUserFirestoreDatasource {
  Future<UserModel?> readUser(String user, String pass) async {
    return users
        .where('user', isEqualTo: user)
        .where('pass', isEqualTo: pass)
        .get()
        .then(
      (value) {
        UserModel? userModel;
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            Map<String, dynamic> valueMap =
                convertToMapFromObject(element.data());
            userModel = UserModel.fromJson(valueMap);
          }
          return userModel;
        } else {
          return throw 'El usuario probablemente no existe';
        }
      },
    ).catchError((error) {
      return throw 'Error al buscar al usuario: $error';
    });
  }

  Map<String, dynamic> convertToMapFromObject(Object? object) {
    try {
      String item = json.encode(object);
      Map<String, dynamic> valueMap = json.decode(item);
      return valueMap;
    } catch (e) {
      return throw 'Data Firestore not convert';
    }
  }
}
