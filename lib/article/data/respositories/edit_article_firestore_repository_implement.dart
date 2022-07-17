import 'package:blog_taller_base_de_datos/article/data/datasource/create_article_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/data/datasource/edit_article_firestore_datasourcea.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/domain/repositories/edit_article_firestore_repository.dart';

class EditArticleFirestoreRepositoryImplement
    implements EditArticleFirestoreRepository {
  final EditArticleFirestoreDatasource editArticleFirestoreDatasource =
      EditArticleFirestoreDatasource();

  @override
  Future editArticle(ArticleModel articleModel) async {
    try {
      await editArticleFirestoreDatasource.editArticle(articleModel);
    } catch (e) {
      throw '$e';
    }
  }
}
