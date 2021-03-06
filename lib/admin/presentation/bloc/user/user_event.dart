part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoginUser extends UserEvent {
  final UserModel user;
  LoginUser(this.user);
}

class LogOutUser extends UserEvent {}

class GetListUsers extends UserEvent {
  final List<UserModel?> listUsers;
  GetListUsers(this.listUsers);
}
