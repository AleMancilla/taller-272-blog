part of 'article_bloc.dart';

@immutable
abstract class ArticleState {
  final List<ArticleModel>? listArticle;
  const ArticleState({this.listArticle});
}

class ArticleInitial extends ArticleState {
  const ArticleInitial() : super(listArticle: null);
}

class ArticleSetState extends ArticleState {
  final List<ArticleModel>? listArticle;
  const ArticleSetState(this.listArticle) : super(listArticle: listArticle);
}
