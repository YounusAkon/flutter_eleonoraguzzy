import 'dart:io';

import 'package:dio/dio.dart';
class TakeSurveyRequestModel {
  final String survey;
  final String? description;
  final File? file;

  TakeSurveyRequestModel({
    required this.survey,
    this.description,
    this.file,
  });

  FormData toFormData() {
    final formData = FormData();

    // ✅ Required field
    formData.fields.add(MapEntry('survey', survey));

    // ✅ ALWAYS send description (backend-safe)
    formData.fields.add(
      MapEntry('description', description ?? ''),
    );

    // ✅ File upload (key MUST be "image")
    if (file != null) {
      formData.files.add(
        MapEntry(
          'image',
          MultipartFile.fromFileSync(
            file!.path,
            filename: file!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}

class TakeSurveysModel {
  final String id;
  final String survey;
  final String user;
  final String? description;
  final SurveyFileModel? file;
  final DateTime createdAt;
  final DateTime updatedAt;

  TakeSurveysModel({
    required this.id,
    required this.survey,
    required this.user,
    this.description,
    this.file,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TakeSurveysModel.fromJson(Map<String, dynamic> json) {
    return TakeSurveysModel(
      id: json['_id'],
      survey: json['survey'],
      user: json['user'],
      description: json['description'],
      file:
          json['file'] != null ? SurveyFileModel.fromJson(json['file']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
class SurveyFileModel {
  final String publicId;
  final String url;

  SurveyFileModel({
    required this.publicId,
    required this.url,
  });

  factory SurveyFileModel.fromJson(Map<String, dynamic> json) {
    return SurveyFileModel(
      publicId: json['public_id'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
