import 'package:bloc/bloc.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:blog_taller_base_de_datos/article/data/models/group_model.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(const ArticleInitial()) {
    // on<ActivateUser>( (event, emit ) => emit( UserSetState( event.user ) ));
    on<ActivateArticleEvent>((event, emit) {
      emit(ArticleSetState(event.listArticle));
    });
    on<ReloadEvent>((event, emit) {
      emit(ArticleSetState([]));
    });
  }
}
