import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:flutter/material.dart';

class TemplateLogin extends StatelessWidget {
  TemplateLogin({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AtomTextTitle(title: "LOGIN"),
          AtomInputText(
            controller: controllerUser,
            labelText: 'Usuario',
          ),
          AtomInputText(
            controller: controllerPass,
            labelText: 'Contraseña',
          ),
          AtomButtonGlobal(
              textButton: 'Iniciar Sesion',
              onTap: () => onPress(controllerUser.text, controllerPass.text)),
        ],
      ),
    );
  }
}
