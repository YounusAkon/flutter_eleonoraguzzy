class VirtuousAwardModel {
  final String? id;
  final String? title;
  final String? description;
  final String? year;
  final String? ctaText;
  final List<String>? winners;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;

  VirtuousAwardModel({
    this.id,
    this.title,
    this.description,
    this.year,
    this.ctaText,
    this.winners,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  factory VirtuousAwardModel.fromJson(Map<String, dynamic> json) {
    return VirtuousAwardModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      year: json['year']?.toString(),
      ctaText: json['ctaText'] as String?,
      winners: (json['winners'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdBy: json['createdBy'] as String?,
    );
  }

  //toJson method
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'year': year,
      'ctaText': ctaText,
      'winners': winners,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
    };
  }
}
