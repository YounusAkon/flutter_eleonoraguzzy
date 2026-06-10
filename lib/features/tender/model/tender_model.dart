class TenderModel {
  bool? success;
  String? message;
  List<Data>? data;

  TenderModel({this.success, this.message, this.data});

  TenderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  File? file;
  String? sId;
  String? name;
  String? date;
  String? description;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.file,
      this.sId,
      this.name,
      this.date,
      this.description,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    file = json['file'] != null ? File.fromJson(json['file']) : null;
    sId = json['_id'];
    name = json['name'];
    date = json['date'];
    description = json['description'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['date'] = this.date;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class File {
  String? publicId;
  String? url;

  File({this.publicId, this.url});

  File.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}
