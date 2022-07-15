part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final UserModel? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitial extends UserState {
  const UserInitial() : super(existUser: false);
}

class UserSetState extends UserState {
  final UserModel user;
  const UserSetState(this.user) : super(user: user, existUser: true);
}
