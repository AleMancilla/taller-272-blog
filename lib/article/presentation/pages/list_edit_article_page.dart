import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_data_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/item_article_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListEditArticlePage extends StatelessWidget {
  const ListEditArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _articleBloc = BlocProvider.of<ArticleBloc>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text('Panel Administrativo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ..._listArticlesEdit(_articleBloc),
            ],
          ),
        ),
      ),
    );
  }

  List<ItemArticleEdit> _listArticlesEdit(ArticleBloc _articleBloc) {
    // ItemArticleEdit
    return _articleBloc.state.listArticle != null
        ? _articleBloc.state.listArticle!
            .map((article) => ItemArticleEdit(articleModel: article))
            .toList()
        : [];
  }
}
