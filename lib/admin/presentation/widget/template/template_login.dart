import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:flutter/material.dart';

class TemplateLogin extends StatelessWidget {
  TemplateLogin({Key? key}) : super(key: key);

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtomLoginText(),
          AtomInputText(
            controller: controllerUser,
            labelText: 'Usuario',
          ),
          AtomInputText(
            controller: controllerPass,
            labelText: 'Contraseña',
          ),
          AtomButtonLogin(),
        ],
      ),
    );
  }
}
