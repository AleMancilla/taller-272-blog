import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:flutter/material.dart';

class TemplateCreateGroup extends StatelessWidget {
  TemplateCreateGroup({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  final TextEditingController controllerTitle = TextEditingController();

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
          const AtomTextTitle(title: "Titulo del grupo"),
          AtomInputText(
            controller: controllerTitle,
            labelText: 'Grupo',
          ),
          AtomButtonGlobal(
              textButton: 'Crear Grupo',
              onTap: () => onPress(controllerTitle.text)),
        ],
      ),
    );
  }
}
