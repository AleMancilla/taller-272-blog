part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class ActivateArticleEvent extends ArticleEvent {
  final List<ArticleModel> listArticle;
  ActivateArticleEvent(this.listArticle);
}
