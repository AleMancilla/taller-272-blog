import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/data/repositories/create_user_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/template/template_create_user.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  CreateUserPage({Key? key}) : super(key: key);

  final CreateUserFirestoreRepositoeyImplement
      createUserFirestoreRepositoeyImplement =
      CreateUserFirestoreRepositoeyImplement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateCreateUser(
            onButtonPress: (UserModel user) => _registerUser(user, context)),
      ),
    );
  }

  _registerUser(UserModel user, BuildContext context) async {
    loadingAsyncFunction(context,
        () async => createUserFirestoreRepositoeyImplement.createUser(user));
  }
}
