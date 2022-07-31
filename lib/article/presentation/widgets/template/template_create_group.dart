import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_button_login.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_input_text.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/atom/atom_login_text.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/group_article/groups_article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateCreateGroup extends StatelessWidget {
  TemplateCreateGroup({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerNivel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _groupArticleBloc =
        BlocProvider.of<GroupsArticleBloc>(context, listen: false);
    controllerNivel.text = '${_getListPosition(_groupArticleBloc)}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AtomTextTitle(title: "Nuevo Grupo"),
          AtomInputText(
            controller: controllerTitle,
            labelText: 'Titulo del Grupo',
          ),
          AtomInputText(
            controller: controllerNivel,
            labelText: 'Nivel del Grupo ( solo numeros )',
          ),
          AtomButtonGlobal(
              textButton: 'Crear Grupo',
              onTap: () => onPress(controllerTitle.text, controllerNivel.text)),
        ],
      ),
    );
  }

  int _getListPosition(GroupsArticleBloc _groupArticleBloc) {
    return _groupArticleBloc.state.listGroup.length + 1;
  }
}
