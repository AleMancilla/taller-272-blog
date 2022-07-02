import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';

abstract class ReadArticlesFirestoreRepository {
  Future<List<ArticleModel>> readListArticles();
}
