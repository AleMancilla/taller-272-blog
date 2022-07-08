import 'package:blog_taller_base_de_datos/admin/data/repositories/read_user_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/template/template_login.dart';
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
        child: TemplateLogin(onPress: () => _readUserIfExist()),
      ),
    );
  }

  _readUserIfExist() {
    try {
      readUserFirestoreRepositoryImplement.readUser('test1', 'bla bla');
    } catch (e) {
      print(e);
    }
  }
}
