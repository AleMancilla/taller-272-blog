import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/core/constants/api_firebase_constant.dart';

class CreateArticleFirestoreDatasource {
  Future<void> addArticle(ArticleModel articleModel) {
    // Call the user's CollectionReference to add a new user
    return articles.add({
      'imageURL': articleModel.imageURL, // John Doe
      'title': articleModel.title, // Stokes and Sons
      'description': articleModel.description // 42
    }).then((value) {
      print("article Added");
      // print(value);
    }).catchError((error) {
      print("Failed to add article: $error");
    });
  }
}