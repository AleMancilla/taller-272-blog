import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/create_article_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/edit_article_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/article/presentation/bloc/article_bloc/article_data_utils.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/home_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/template_create_article.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class CreateArticlePage extends StatelessWidget {
  CreateArticlePage({Key? key, this.article}) : super(key: key);

  final CreateArticleFirestoreRepositoryImplement
      createArticleFirestoreRepositoryImplement =
      CreateArticleFirestoreRepositoryImplement();

  final EditArticleFirestoreRepositoryImplement
      editArticleFirestoreRepositoryImplement =
      EditArticleFirestoreRepositoryImplement();

  final ArticleModel? article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateCreateArticle(
          onButtonPress: article != null
              ? (ArticleModel article) => _editArticle(article, context)
              : (ArticleModel article) => _insertArticle(article, context),
          imageUrl: article?.imageURL,
          description: article?.description,
          title: article?.title,
          levelGroup: article?.orderLevel,
        ),
      ),
    );
  }

  Future _editArticle(ArticleModel articleModel, BuildContext context) async {
    ArticleModel _article = article!.copyWith(
      title: articleModel.title,
      description: articleModel.description,
      imageURL: articleModel.imageURL,
      groupTheme: articleModel.groupTheme,
      orderLevel: articleModel.orderLevel,
    );
    await loadingAsyncFunction(
      context,
      () async {
        await editArticleFirestoreRepositoryImplement.editArticle(_article);
        return await chargeAllArticles(context);
      },
    );
    showCorrectAlert(context, 'Exito', 'Se edito correctamente el articulo');
    Navigator.pop(context);
    // navigateToPageAndRemove(context, const HomePage());
    // chargeAllArticles(context);
  }

  Future _insertArticle(ArticleModel article, BuildContext context) async {
    await loadingAsyncFunction(
      context,
      () async {
        await createArticleFirestoreRepositoryImplement.createArticle(article);
        return await chargeAllArticles(context);
      },
    );
    showCorrectAlert(context, 'Exito', 'Se agrego correctamente el articulo');
    Navigator.pop(context);
    // navigateToPageAndRemove(context, const HomePage());
    // chargeAllArticles(context);
  }
}
