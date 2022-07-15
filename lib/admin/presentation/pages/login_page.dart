import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_bloc.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_data_utils.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/template/template_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userBlocProvider = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateLogin(
            onPress: (String user, String pass) =>
                readUserIfExist(user, pass, context, _userBlocProvider)),
      ),
    );
  }
}
