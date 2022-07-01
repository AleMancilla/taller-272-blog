import 'package:blog_taller_base_de_datos/admin/presentation/pages/login_page.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:blog_taller_base_de_datos/core/utils_colors.dart';
import 'package:flutter/material.dart';

class PersonalizedAppBar extends StatelessWidget {
  const PersonalizedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // PersonalizedSearch(),
          InkWell(
            child: Text('Iniciar Sesion'),
            onTap: () {
              openPage(context, LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
