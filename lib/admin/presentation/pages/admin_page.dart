import 'dart:math';

import 'package:blog_taller_base_de_datos/admin/presentation/pages/create_user_page.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/molecule/button_molecule.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/create_article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/list_edit_article_page.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Panel Administrativo'),
      ),
      body: Center(
        child: Container(
          width: min(size.width, 900),
          alignment: Alignment.center,
          child: Wrap(
            children: [
              ButtonMolecule(
                text: 'Agregar Nuevo Articulo',
                ontap: () {
                  navigateToPage(context, CreateArticlePage());
                },
                icon: Icons.list,
              ),
              ButtonMolecule(
                text: 'Agregar Nuevo Usuario',
                ontap: () {
                  navigateToPage(context, CreateUserPage());
                },
                icon: Icons.person_add_alt,
              ),
              ButtonMolecule(
                text: 'Editar Articulo',
                ontap: () {
                  navigateToPage(context, const ListEditArticlePage());
                },
                colors: Colors.blue.shade200,
                icon: Icons.edit_note,
              ),
              ButtonMolecule(
                text: 'Editar Usuarios',
                ontap: () {},
                colors: Colors.blue.shade200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
