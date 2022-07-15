import 'package:bloc/bloc.dart';
import 'package:blog_taller_base_de_datos/article/data/models/article_model.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    // on<ActivateUser>( (event, emit ) => emit( UserSetState( event.user ) ));
    on<ActivateArticleEvent>((event, emit) {
      print('----=-=-= hola');
      // ArticleSetState(event.listArticle);
      emit(ArticleSetState(event.listArticle));
    });
  }
}
