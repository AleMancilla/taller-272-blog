import 'package:blog_taller_base_de_datos/article/data/datasource/create_article_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/domain/repositories/create_article_firestore_repository.dart';

class CreateArticleFirestoreRepositoryImplement
    implements CreateArticleFirestoreRepository {
  final CreateArticleFirestoreDatasource createArticleFirestoreDatasource =
      CreateArticleFirestoreDatasource();

  @override
  Future createArticle(ArticleModel articleModel) async {
    try {
      await createArticleFirestoreDatasource.addArticle(articleModel);
    } catch (e) {
      throw '$e';
    }
  }
}
