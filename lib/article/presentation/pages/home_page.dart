import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_data_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/group_article/group_article_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/group_article/groups_article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/personalized_title.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/personalized_app_bar.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/personalized_buttom_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _articleBloc = BlocProvider.of<ArticleBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Column(
        children: [
          PersonalizedAppBar(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              padding:
                  EdgeInsets.symmetric(horizontal: size.width > 750 ? 50 : 10),
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (_, state) {
                  if (state.listArticle != null) {
                    return _showListArticles(state, context);
                  } else {
                    return chargeAllArticlesWidget(context,
                        articleBloc: _articleBloc);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showListArticles(ArticleState state, BuildContext context) {
    final _groupArticleBloc =
        BlocProvider.of<GroupsArticleBloc>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          const PersonalizedTitle(),

          getBlocGroups(state, _groupArticleBloc, context),
          // ...getListArticle(
          //     state.listArticle!, _groupArticleBloc.state.listGroup),
          const PersonalizedButtomInfo(),
        ],
      ),
    );
  }
}
