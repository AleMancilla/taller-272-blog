import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/data/repositories/read_user_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_bloc.dart';
import 'package:blog_taller_base_de_datos/core/app_preferens.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/cupertino.dart';

final AppPreferens prefs = AppPreferens();

final ReadUserFirestoreRepositoryImplement
    readUserFirestoreRepositoryImplement =
    ReadUserFirestoreRepositoryImplement();

chargeDataUser(UserBloc _userBlocProvider) {
  if (prefs.userName != 'NULL') {
    UserModel userModel = prefs.getUserModelFromPreferens();
    _userBlocProvider.add(LoginUser(userModel));
  }
}

chargeDateInPreferens(UserModel user) {
  prefs.userName = user.user;
  prefs.userPass = user.pass;
  prefs.userLevel = user.level;
}

readUserIfExist(String _user, String pass, BuildContext context,
    UserBloc _userBlocProvider) async {
  try {
    bool userLoged = false;

    Future.delayed(Duration.zero, () async {
      await loadingAsyncFunction(context, () async {
        try {
          await readUserFirestoreRepositoryImplement
              .readUser(_user, pass)
              .then((value) {
            userLoged = true;
            _userBlocProvider.add(LoginUser(value!));
          });
        } catch (e) {
          showErrorAlert(context, 'No se pudo iniciar sesión', '$e');
        }
        return;
      });

      if (userLoged) {
        Navigator.pop(context);
        showCorrectAlert(
            context, 'sesión iniciada correctamente', 'Bienvenido');
      }
    });
  } catch (e) {
    showErrorAlert(context, 'No se pudo iniciar sesión', '$e');
  }
}
