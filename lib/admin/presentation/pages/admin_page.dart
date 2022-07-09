import 'package:blog_taller_base_de_datos/admin/presentation/pages/create_user_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/create_article_page.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Panel Administrativo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                openPage(context, CreateUserPage());
              },
              backgroundColor: Colors.blueGrey[900],
              label: Text('Agregar Nuevo Usuario'),
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey[900],
              onPressed: () {
                openPage(context, CreateArticlePage());
              },
              label: Text('Agregar Nuevo Articulo'),
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey[900],
              onPressed: () {},
              label: Text('Editar Articulo'),
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey[900],
              onPressed: () {},
              label: Text('Editar Usuarios'),
            ),
          ],
        ),
      ),
    );
  }
}
