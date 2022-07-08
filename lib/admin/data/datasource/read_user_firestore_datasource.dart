import 'dart:convert';
import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';

class ReadUserFirestoreDatasource {
  Future<UserModel> readUser(String user, String pass) async {
    return users.where('user22', isEqualTo: 'test1').get().then(
      (value) {
        // value.docs[];
        Map<String, dynamic> data =
            json.decode(json.encode(value.docs[0].data()));
        UserModel userModel = UserModel.fromJson(data);
        print('--------');
        print(userModel.user);
        print('--------');
        return UserModel(user: user, pass: pass, level: 'ADMIN');
      },
    ).catchError((error) {
      return throw 'Error al buscar al usuario';
    });
  }
}
