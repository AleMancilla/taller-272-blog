class UserModel {
  late String user;
  late String pass;
  late String level;
  String? idUser;
  String? name;
  String? photo;
  String? work;
  String? description;
  String? contact;
  bool? activate;
  DateTime? dateCreate;

  UserModel({
    required this.user,
    required this.pass,
    required this.level,
    this.idUser,
    this.name,
    this.photo,
    this.work,
    this.description,
    this.contact,
    this.activate,
    this.dateCreate,
  });
}
