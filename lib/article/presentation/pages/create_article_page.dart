import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/respositories/create_article_firestore_repository_implement.dart';
import 'package:blog_taller_base_de_datos/article/presentation/pages/home_page.dart';
import 'package:blog_taller_base_de_datos/article/presentation/widgets/template/template_create_article.dart';
import 'package:blog_taller_base_de_datos/core/utils.dart';
import 'package:flutter/material.dart';

class CreateArticlePage extends StatelessWidget {
  CreateArticlePage({Key? key}) : super(key: key);

  final CreateArticleFirestoreRepositoryImplement
      createArticleFirestoreRepositoryImplement =
      CreateArticleFirestoreRepositoryImplement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TemplateCreateArticle(
            onButtonPress: (ArticleModel article) =>
                _insertArticle(article, context)),
      ),
    );
  }

  _insertArticle(ArticleModel article, BuildContext context) async {
    await loadingAsyncFunction(
      context,
      () async => await createArticleFirestoreRepositoryImplement
          .createArticle(article),
    );
    showCorrectAlert(context, 'Exito', 'Se agrego correctamente el articulo');
    navigateToPageAndRemove(context, const HomePage());
  }
}
