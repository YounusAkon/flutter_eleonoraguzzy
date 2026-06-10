class ActiveSurveysModel {
  final String id;
  final String name;
  final String date;
  final String location;
  final String description;
  final String createdBy;
  final String createdAt;
  final String updatedAt;

  ActiveSurveysModel({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ActiveSurveysModel.fromJson(Map<String, dynamic> json) {
    return ActiveSurveysModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      date: json['date'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      createdBy: json['createdBy'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
