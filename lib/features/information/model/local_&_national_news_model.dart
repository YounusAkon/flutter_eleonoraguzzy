class LocalAndNationalNewsModel {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? category;
  String? publishDate;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  List<MainValue> mainValues;
  NewsImage? image;
  final String? color;

  LocalAndNationalNewsModel({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.category,
    this.publishDate,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.mainValues = const [],
    this.color,
  });

  factory LocalAndNationalNewsModel.fromJson(Map<String, dynamic> json) {
    return LocalAndNationalNewsModel(
      id: json['_id'],
      title: json['title'],
      subTitle: json['subTitle'],
      description: json['description'],
      category: json['category'],
      publishDate: json['publishDate'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      mainValues: json['mainValues'] != null
          ? List<MainValue>.from(
              json['mainValues'].map((x) => MainValue.fromJson(x)))
          : [],
      image: json['image'] != null ? NewsImage.fromJson(json['image']) : null,
      color: json['color'],
    );
  }
}

class MainValue {
  String? heading;
  String? id;

  MainValue({this.heading, this.id});

  factory MainValue.fromJson(Map<String, dynamic> json) {
    return MainValue(
      heading: json['heading'],
      id: json['_id'],
    );
  }
}

class NewsImage {
  String? publicId;
  String? url;

  NewsImage({this.publicId, this.url});

  factory NewsImage.fromJson(Map<String, dynamic> json) {
    return NewsImage(
      publicId: json['public_id'],
      url: json['url'],
    );
  }
}
