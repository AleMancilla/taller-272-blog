import 'package:bloc/bloc.dart';
import 'package:blog_taller_base_de_datos/admin/data/models/user_model.dart';
import 'package:blog_taller_base_de_datos/admin/presentation/bloc/user/user_data_utils.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<LoginUser>((event, emit) {
      chargeDateInPreferens(event.user);

      emit(UserSetState(event.user));
    });

    on<LogOutUser>((event, emit) {
      emit(const UserInitial());
    });
  }
}
