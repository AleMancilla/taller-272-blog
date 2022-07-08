import 'package:blog_taller_base_de_datos/article/data/datasource/read_articles_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/domain/repositories/read_articles_firestore_repository.dart';

class ReadListArticleFirestoreRepositoryImplements
    implements ReadArticlesFirestoreRepository {
  final ReadArticlesFirestoreDatasource readArticlesFirestoreDatasource =
      ReadArticlesFirestoreDatasource();

  @override
  Future<List<ArticleModel>> readListArticles() {
    try {
      return readArticlesFirestoreDatasource.readArticles();
    } catch (e) {
      throw '$e';
    }
  }
}
