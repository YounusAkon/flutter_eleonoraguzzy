import 'dart:io';
import 'package:dio/dio.dart';

class EditProfileModel {
  final String? name;
  final File? avatarFile;

  EditProfileModel({
    this.name,
    this.avatarFile,
  });

  FormData toFormData() {
    final formData = FormData();

    if (name != null) {
      formData.fields.add(MapEntry('name', name!));
    }

    if (avatarFile != null) {
      formData.files.add(
        MapEntry(
          'avatar',
          MultipartFile.fromFileSync(
            avatarFile!.path,
            filename: avatarFile!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
