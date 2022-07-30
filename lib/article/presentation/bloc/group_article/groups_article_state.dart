part of 'groups_article_bloc.dart';

@immutable
abstract class GroupsArticleState {
  final List<GroupModel> listGroup;
  const GroupsArticleState({required this.listGroup});
}

class GroupsArticleInitial extends GroupsArticleState {
  GroupsArticleInitial() : super(listGroup: []);
}

class GroupsArticleSetState extends GroupsArticleState {
  final List<GroupModel> listGr;
  const GroupsArticleSetState(this.listGr) : super(listGroup: listGr);
}
