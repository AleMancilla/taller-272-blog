import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateArticleFirestoreDatasource {
  Future<void> addArticle(ArticleModel articleModel) {
    // Call the user's CollectionReference to add a new user
    return articles.add({
      'imageURL': articleModel.imageURL, // John Doe
      'title': articleModel.title, // Stokes and Sons
      'description': articleModel.description, // 42
      'creationDate': FieldValue.serverTimestamp(),
      'actualizationDate': FieldValue.serverTimestamp(),
      'collaborators': articleModel.collaborators,
      'importanceLevel': 1
    }).then((value) {
      print("article Added");
      // print(value);
    }).catchError((error) {
      throw ("Failed to add article: $error");
    });
  }
}
