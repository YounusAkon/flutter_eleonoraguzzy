class ElectoralProgressModel {
  String? id;
  String? title;
  String? description;
  List<ElectoralItem>? items;

  ElectoralProgressModel({
    this.id,
    this.title,
    this.description,
    this.items,
  });

  factory ElectoralProgressModel.fromJson(Map<String, dynamic> json) {
    return ElectoralProgressModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      items: (json['items'] as List?)
          ?.map((e) => ElectoralItem.fromJson(e))
          .toList(),
    );
  }
}

class ElectoralItem {
  String? id;
  String? label;
  int? score;
  List<ElectoralProgress>? progress;

  ElectoralItem({
    this.id,
    this.label,
    this.score,
    this.progress,
  });

  factory ElectoralItem.fromJson(Map<String, dynamic> json) {
    return ElectoralItem(
      id: json['_id'],
      label: json['label'],
      score: json['score'],
      progress: (json['progress'] as List<dynamic>?)
          ?.map((e) => ElectoralProgress.fromJson(e))
          .toList(),
    );
  }
}

class ElectoralProgress {
  String? id;
  String? title;
  int? percentage;
  String? status;

  ElectoralProgress({
    this.id,
    this.title,
    this.percentage,
    this.status,
  });

  factory ElectoralProgress.fromJson(Map<String, dynamic> json) {
    return ElectoralProgress(
      id: json['_id'],
      title: json['title'],
      percentage: json['percentage'],
      status: json['status'],
    );
  }
}
