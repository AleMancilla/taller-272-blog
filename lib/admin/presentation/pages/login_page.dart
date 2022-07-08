import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/data/repositories/read_user_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/template/template_login.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final ReadUserFirestoreRepositoryImplement
      readUserFirestoreRepositoryImplement =
      ReadUserFirestoreRepositoryImplement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateLogin(
            onPress: (String user, String pass) =>
                _readUserIfExist(user, pass, context)),
      ),
    );
  }

  _readUserIfExist(String _user, String pass, BuildContext context) async {
    try {
      UserModel? user;

      await loadingAsyncFunction(context, () async {
        try {
          user =
              await readUserFirestoreRepositoryImplement.readUser(_user, pass);
        } catch (e) {
          print('xxxxxx');
          print(e);
        }
        return;
      });

      if (user != null) {
        print('encontro el usuario');
      } else {
        print('USUARIO NULO');
      }

      print(user);
    } catch (e) {
      print(e);
    }
  }

  // chargeUser() async {
  //   Future.delayed(Duration.zero, () {
  //     loadingAsyncFunction(context, () async => asingAllItems());
  //   });
  // }

  // asingAllItems() async {
  //   listArticle =
  //       await readListArticleFirestoreRepositoryImplements.readListArticles();
  //   setState(() {});
  // }

}
