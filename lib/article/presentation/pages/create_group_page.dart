import 'package:blog_taller_base_de_datos/article/data/datasource/create_group_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/group_article/groups_article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/template_create_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _groupArticleBloc =
    //     BlocProvider.of<GroupsArticleBloc>(context, listen: false);

    final CreateGroupFirestoreDatasource createGroupFirestoreDatasource =
        CreateGroupFirestoreDatasource();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateCreateGroup(onPress: (String title, String nivel) {
          print('===');
          createGroupFirestoreDatasource.addGroup(
              GroupModel(title, nivelOrdenamiento: double.parse(nivel)));
          Navigator.pop(context);
          // return readUserIfExist(user, context, _userBlocProvider);
        }),
      ),
    );
  }
}
