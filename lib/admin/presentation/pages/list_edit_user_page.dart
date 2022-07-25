import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_bloc.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_data_utils.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/widget/template/template_user_list_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListEditUserPage extends StatelessWidget {
  const ListEditUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userBlocProvider = BlocProvider.of<UserBloc>(context, listen: false);
    // final _articleBloc = BlocProvider.of<ArticleBloc>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Panel Administrativo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // chargeAllArticlesWidget(context, articleBloc: _articleBloc);
          // _articleBloc.add(ReloadEvent());
          print('lo hixzo');
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (_, state) {
                  if (state.listUser != null) {
                    return _showListUser(state);
                  } else {
                    return chargeAllUserWidget(context,
                        userBloc: _userBlocProvider);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // List<TemplateUserListEdit> _listUserEdit(UserBloc _userBloc) {
  //   // ItemArticleEdit
  //   return _userBloc.state.listUser!= null
  //       ? _userBloc.state.listUser!
  //           .map((user) => TemplateUserListEdit(user: user,))
  //           .toList()
  //       : [];
  // }

  Widget _showListUser(UserState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...getListUser(state.listUser),
          // const PersonalizedTitle(),
          // ...getListArticle(state.listArticle!),
          // const PersonalizedButtomInfo(),
        ],
      ),
    );
  }

  List<Widget> getListUser(List<UserModel?>? listUser) {
    return listUser?.map((e) {
          return TemplateUserListEdit(user: e!);
        }).toList() ??
        [];
  }
}
