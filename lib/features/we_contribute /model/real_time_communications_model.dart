class RealTimeCommunicationsModel {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final String? type;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;

  RealTimeCommunicationsModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  factory RealTimeCommunicationsModel.fromJson(Map<String, dynamic> json) {
    return RealTimeCommunicationsModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date'] as String) : null,
      type: json['type'] as String?,
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
      'date': date?.toIso8601String(),
      'type': type,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
    };
  }
}
