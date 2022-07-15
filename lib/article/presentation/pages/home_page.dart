import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/read_list_article_firestore_repository_implements.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_bloc.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/create_article_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/molecule/personalized_title.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/item_article.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/personalized_app_bar.dart';
import 'package:blog_taller_base_de_datos/core/app_preferens.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
// List<ArticleModel> listArticle = [];
class HomePage extends StatelessWidget {
  final ReadListArticleFirestoreRepositoryImplements
      readListArticleFirestoreRepositoryImplements =
      ReadListArticleFirestoreRepositoryImplements();

  final AppPreferens prefs = AppPreferens();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _articleBloc = BlocProvider.of<ArticleBloc>(context, listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Column(
        children: [
          PersonalizedAppBar(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (context, state) {
                  print('### ${state.listArticle}');
                  if (state.listArticle != null) {
                    print('----- asdasdasdasdasd ');
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const PersonalizedTitle(),
                          ...getListArticle(state.listArticle!),
                        ],
                      ),
                    );
                  } else {
                    Future.delayed(Duration.zero, () {
                      // showProgressIndicator(context);
                      loadingAsyncFunction(
                          context, () async => getAllArticles(_articleBloc));
                    });

                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getListArticle(List<ArticleModel> listArticle) {
    return listArticle.map((e) {
      return ItemArticle(articleModel: e);
    }).toList();
  }

  getAllArticles(_articleBloc) async {
    await readListArticleFirestoreRepositoryImplements
        .readListArticles()
        .then((value) {
      print("finalizo la lectura de articulos con ${value.length} articulos");
      _articleBloc.add(ActivateArticleEvent(value));
    });
  }
}
