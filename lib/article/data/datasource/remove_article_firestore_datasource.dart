import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';

class RemoveArticleFirestoreDatasource {
  Future<void> deleteArticle(String id) {
    return articles
        .doc(id)
        .delete()
        .then((value) => print("article Deleted"))
        .catchError((error) => throw "Failed to delete article: $error");
  }
}
