import 'package:blog_taller_base_de_datos/article/data/datasource/remove_article_firestore_datasource.dart';
import 'package:blog_taller_base_de_datos/article/domain/repositories/delete_article_firestore_repository.dart';

class DeleteArticleFirestoreRepositoryImplement
    implements DeleteArticleFirestoreRepository {
  final RemoveArticleFirestoreDatasource removeArticleFirestoreDatasource =
      RemoveArticleFirestoreDatasource();

  @override
  Future deleteArticle(String idArticle) async {
    try {
      await removeArticleFirestoreDatasource.deleteArticle(idArticle);
    } catch (e) {
      throw '$e';
    }
  }
}
