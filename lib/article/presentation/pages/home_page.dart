import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_data_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/personalized_title.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/item_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/personalized_app_bar.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/personalized_buttom_info.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _articleBloc = BlocProvider.of<ArticleBloc>(context, listen: false);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Column(
        children: [
          PersonalizedAppBar(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (_, state) {
                  if (state.listArticle != null) {
                    return _showListArticles(state);
                  } else {
                    return _chargeAllArticles(context, _articleBloc);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showListArticles(ArticleState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PersonalizedTitle(),
          ...getListArticle(state.listArticle!),
          const PersonalizedButtomInfo(),
        ],
      ),
    );
  }

  Widget _chargeAllArticles(BuildContext context, ArticleBloc _articleBloc) {
    Future.delayed(Duration.zero, () {
      // showProgressIndicator(context);
      loadingAsyncFunction(
          context, () async => await getAllArticles(_articleBloc));
    });

    return Container();
  }

  List<Widget> getListArticle(List<ArticleModel> listArticle) {
    return listArticle.map((e) {
      return ItemArticle(articleModel: e);
    }).toList();
  }
}
