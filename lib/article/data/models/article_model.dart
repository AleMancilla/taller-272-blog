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

  ArticleModel({
    this.idArticulo,
    required this.title,
    required this.description,
    required this.imageURL,
    this.dateCreation,
    this.dateModify,
    this.groupTheme,
    this.collaborators,
    this.orderLevel = 1,
  });

  ArticleModel copyWith({
    String? idArticulo,
    required String title,
    required String description,
    required String imageURL,
    String? groupTheme,
    DateTime? dateCreation,
    DateTime? dateModify,
    List<String>? collaborators,
    int? orderLevel,
  }) {
    return ArticleModel(
      idArticulo: idArticulo ?? this.idArticulo,
      title: title ?? this.title,
      description: description ?? this.description,
      imageURL: imageURL ?? this.imageURL,
      dateCreation: dateCreation ?? this.dateCreation,
      dateModify: dateModify ?? this.dateModify,
      groupTheme: groupTheme ?? this.groupTheme,
      collaborators: collaborators ?? this.collaborators,
      orderLevel: orderLevel ?? this.orderLevel,
    );
  }
}
