import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/molecule/drop_down_list.dart';
import 'package:flutter/material.dart';

class TemplateCreateUser extends StatelessWidget {
  TemplateCreateUser({Key? key, this.onButtonPress}) : super(key: key);

  final Function? onButtonPress;

  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLevel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AtomTextTitle(title: "CREAR USUARIO"),
          AtomInputText(
            controller: controllerUser,
            labelText: '* Usuario de inicio de sesion ',
          ),
          AtomInputText(
            controller: controllerPass,
            labelText: '* Contraseña',
          ),
          AtomInputText(
            controller: controllerName,
            labelText: 'Nombre',
          ),
          // AtomInputText(
          //   controller: controllerLevel,
          //   labelText: '* Nivel de permiso',
          // ),
          DropDownList(
            controllerLevel: controllerLevel,
            listItems: const [
              'ADMINISTRADOR',
              'CREADOR',
              'EDITOR',
            ],
            defaultText: 'Elija el nivel de permiso',
          ),
          AtomButtonGlobal(
            textButton: 'Crear Usuario',
            onTap: registerUser,
          ),
        ],
      ),
    );
  }

  registerUser() {
    onButtonPress!(UserModel(
      user: controllerUser.text,
      pass: controllerPass.text,
      level: controllerLevel.text,
      name: controllerName.text,
      activate: true,
    ));

    controllerUser.clear();
    controllerPass.clear();
    controllerLevel.clear();
    controllerName.clear();
  }
}
