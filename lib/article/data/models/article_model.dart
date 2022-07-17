class ArticleModel {
  String? idArticulo;
  String title;
  String description;
  String imageURL;
  String? groupTheme;
  DateTime? dateCreation;
  DateTime? dateModify;
  List<String>? collaborators;
  int? orderLevel;

  ArticleModel(
      {this.idArticulo,
      required this.title,
      required this.description,
      required this.imageURL,
      this.dateCreation,
      this.dateModify,
      this.groupTheme,
      this.collaborators,
      this.orderLevel = 1});
}
