class ArticleModel {
  String? idArticulo;
  String title;
  String description;
  String imageURL;
  DateTime? dateCreation;
  DateTime? dateModify;
  List<String>? collaborators;

  ArticleModel({
    this.idArticulo,
    required this.title,
    required this.description,
    required this.imageURL,
    this.dateCreation,
    this.dateModify,
    this.collaborators,
  });
}
