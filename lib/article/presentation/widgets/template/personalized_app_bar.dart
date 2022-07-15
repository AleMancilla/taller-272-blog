import 'package:blog_taller_base_de_datos/admin/presentation/pages/admin_page.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/pages/login_page.dart';
import 'package:blog_taller_base_de_datos/core/app_preferens.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalizedAppBar extends StatelessWidget {
  PersonalizedAppBar({Key? key}) : super(key: key);
  final AppPreferens prefs = AppPreferens();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // PersonalizedSearch(),
          _getButtonSession(context),
        ],
      ),
    );
  }

  Widget _getButtonSession(BuildContext context) {
    if (prefs.userName != 'NULL') {
      return Row(
        children: [
          _usuarioOptions(context),
          _cerrarSesion(),
        ],
      );
    }
    return _iniciarSesion(context);
  }

  InkWell _iniciarSesion(BuildContext context) {
    return InkWell(
      child: const Text('Iniciar Sesion'),
      onTap: () {
        openPage(context, LoginPage());
      },
    );
  }

  Widget _usuarioOptions(BuildContext context) {
    return InkWell(
      onTap: () {
        // prefs.signOffUser();
        openPage(context, AdminPage());
      },
      child: Row(
        children: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Administrar'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
    );
  }

  InkWell _cerrarSesion() {
    return InkWell(
      child: const Text('Cerrar Sesion'),
      onTap: () {
        prefs.signOffUser();
        // openPage(context, LoginPage());
      },
    );
  }
}
