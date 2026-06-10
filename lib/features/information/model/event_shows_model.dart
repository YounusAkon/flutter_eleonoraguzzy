// class EventShowsModel {
//   final String id;
//   final String name;
//   final String tag;
//   String? startdate;
//   String? enddate;
//   final String location;
//   final String description;
//   final String createdAt;
//   final String updatedAt;
//   final String createdBy;

//   EventShowsModel({
//     required this.id,
//     required this.name,
//     required this.tag,
//     this.startdate,
//     this.enddate,
//     required this.location,
//     required this.description,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//   });

//   factory EventShowsModel.fromJson(Map<String, dynamic> json) {
//     return EventShowsModel(
//       id: json['_id'] as String,
//       name: json['name'] as String,
//       tag: json['tag'] as String,
//       startdate: json['date'] as String,
//       enddate: json['date'] as String,
//       location: json['location'] as String,
//       description: json['description'] as String,
//       createdAt: json['createdAt'] as String,
//       updatedAt: json['updatedAt'] as String,
//       createdBy: json['createdBy'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'name': name,
//       'tag': tag,
//       'startdate': startdate,
//       'enddate': enddate,
//       'location': location,
//       'description': description,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       'createdBy': createdBy,
//     };
//   }
// }



class EventShowsModel {
  final String id;
  final String name;
  final String tag;
  final String? startdate;
  final String? enddate;
  final String location;
  final String description;
  final String createdAt;
  final String updatedAt;
  final String createdBy;

  EventShowsModel({
    required this.id,
    required this.name,
    required this.tag,
    this.startdate,
    this.enddate,
    required this.location,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  factory EventShowsModel.fromJson(Map<String, dynamic> json) {
    return EventShowsModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      tag: json['tag'] ?? '',
      startdate: json['startDate'] != null
          ? DateTime.parse(json['startDate']).toLocal().toString().split(' ')[0]
          : null,
      enddate: json['endDate'] != null
          ? DateTime.parse(json['endDate']).toLocal().toString().split(' ')[0]
          : null,
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      createdBy: json['createdBy'] ?? '',
    );
  }
}
