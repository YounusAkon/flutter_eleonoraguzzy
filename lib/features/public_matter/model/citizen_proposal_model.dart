class PublicMatterModel {
  final String? id;
  final String? name;
  final String? comment;
  final String? category;
  final String? createdAt;

  PublicMatterModel({
    this.id,
    this.name,
    this.comment,
    this.category,
    this.createdAt,
  });

  factory PublicMatterModel.fromJson(Map<String, dynamic> json) {
    return PublicMatterModel(
      id: json['_id'],
      name: json['name'],
      comment: json['comment'],
      category: json['category'],
      createdAt: json['createdAt'],
    );
  }
}

class PublicMatterRequestModel {
  final String name;
  final String comment;
  final String category;

  PublicMatterRequestModel({
    required this.name,
    required this.comment,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "comment": comment,
      "category": category,
    };
  }
}
