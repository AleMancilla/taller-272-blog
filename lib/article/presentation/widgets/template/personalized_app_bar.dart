import 'package:blog_taller_base_de_datos/admin/presentation/pages/login_page.dart';
import 'package:blog_taller_base_de_datos/core/app_preferens.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

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
      return InkWell(
        child: const Text('Cerrar Sesion'),
        onTap: () {
          prefs.signOffUser();
          // openPage(context, LoginPage());
        },
      );
    }
    return InkWell(
      child: const Text('Iniciar Sesion'),
      onTap: () {
        openPage(context, LoginPage());
      },
    );
  }
}
