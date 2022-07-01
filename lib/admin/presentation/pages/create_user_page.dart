import 'package:blog_taller_base_de_datos/admin/presentation/widget/template/template_create_user.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateCreateUser(),
      ),
    );
  }
}
