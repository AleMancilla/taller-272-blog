part of 'groups_article_bloc.dart';

@immutable
abstract class GroupsArticleEvent {}

class GroupsArticleSetStateEvent extends GroupsArticleEvent {
  final List<GroupModel> listgr;
  GroupsArticleSetStateEvent(this.listgr);
}
