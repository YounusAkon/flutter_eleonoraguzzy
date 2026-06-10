class CommentsModel {
  final String? id;
  final String? name;
  final String? comment;

  CommentsModel({this.id, this.name, this.comment});

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      id: json['id'],
      name: json['name'],
      comment: json['comment'],
    );
  }
}
