enum NotificationType {
  price_increase,
  subscription_update,
  savings_alert,
  general;

  factory NotificationType.fromString(String name) {
    switch (name) {
      case "price_increase":
        return NotificationType.price_increase;
      case "subscription_update":
        return NotificationType.subscription_update;
      case "savings_alert":
        return NotificationType.savings_alert;
      case "general":
        return NotificationType.general;
      default:
        return NotificationType.general;
    }
  }

  String get value => name;
}
class NotificationModel {
  final String id;
  final String user;
  final String title;
  final String message;
  final NotificationType type;
  final String? relatedProduct;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isExpanded;

  NotificationModel({
    required this.id,
    required this.user,
    required this.title,
    required this.message,
    required this.type,
    this.relatedProduct,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    this.isExpanded = false,

  });

  /// Parse single notification JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] as String? ?? '',
      user: json['user'] as String? ?? '',
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      type: NotificationType.fromString(json['type'] as String? ?? 'general'),
      relatedProduct: json['relatedProduct'] as String?,
      isRead: json['isRead'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      

    );
  }

  /// Parse list of notifications
  static List<NotificationModel> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((e) => NotificationModel.fromJson(e))
        .toList();
  }

  NotificationModel copyWith({
    String? id,
    String? user,
    String? title,
    String? message,
    NotificationType? type,
    String? relatedProduct,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isExpanded,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      user: user ?? this.user,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      relatedProduct: relatedProduct ?? this.relatedProduct,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
