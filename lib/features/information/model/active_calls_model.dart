class ActiveCallsModel {
  final String? id;
  final String title;
  final String tag;
  final String description;
  final String deadline;
  final String? ammount;
  final int? seats;                     // <-- FIXED
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;

  ActiveCallsModel({
    required this.id,
    required this.title,
    required this.tag,
    required this.description,
    required this.deadline,
    this.ammount,
    this.seats,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  factory ActiveCallsModel.fromJson(Map<String, dynamic> json) {
    return ActiveCallsModel(
      id: json['_id'],
      title: json['title'] ?? '',
      tag: json['tag'] ?? '',
      description: json['description'] ?? '',
      deadline: json['deadline'] ?? '',
      ammount: json['ammount'],
      seats: json['seats'] is int
          ? json['seats']
          : int.tryParse(json['seats']?.toString() ?? ''),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdBy: json['createdBy'],
    );
  }
}
