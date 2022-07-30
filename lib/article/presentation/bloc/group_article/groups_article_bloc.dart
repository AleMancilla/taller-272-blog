import 'package:bloc/bloc.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:meta/meta.dart';

part 'groups_article_event.dart';
part 'groups_article_state.dart';

class GroupsArticleBloc extends Bloc<GroupsArticleEvent, GroupsArticleState> {
  GroupsArticleBloc() : super(GroupsArticleInitial()) {
    on<GroupsArticleEvent>((event, emit) {});
    on<GroupsArticleSetStateEvent>((event, emit) {
      emit(GroupsArticleSetState(event.listgr));
    });
  }
}
