part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final UserModel? user;
  final List<UserModel?>? listUser;

  const UserState({this.listUser, this.existUser = false, this.user});
}

class UserInitial extends UserState {
  const UserInitial() : super(existUser: false);
}

class UserSetState extends UserState {
  final UserModel user;
  const UserSetState(this.user) : super(user: user, existUser: true);
}

class UserListState extends UserState {
  final List<UserModel?> lista;
  const UserListState(this.lista) : super(listUser: lista);
}
