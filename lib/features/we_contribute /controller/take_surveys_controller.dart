import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/take_surveys_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/service/contribute_interface.dart';
import 'package:get/get.dart';

class TakeSurveyController extends GetxController {
  TakeSurveyController({required this.surveyId, required this.repository});

  // ------------------ Dependencies ------------------
  final String surveyId;
  final ContributeInterface repository;

  // ------------------ State ------------------
  final textController = TextEditingController();
  PlatformFile? selectedFile;

  final isLoading = false.obs;

  // ------------------ Dispose ------------------
  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  // ------------------ Pick File ------------------
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: false,
    );

    if (result == null || result.files.isEmpty) return;

    final file = result.files.single;

    // size limit: 10 MB
    if (file.size > 10 * 1024 * 1024) {
      Get.snackbar('Error', 'File must be ≤ 10MB');
      return;
    }

    selectedFile = file;
    update();
  }

  // ------------------ Remove File ------------------
  void removeFile() {
    selectedFile = null;
    update();
  }

  // ------------------ Submit Survey ------------------
  Future<void> submitSurvey() async {
    if ((textController.text.isEmpty) && selectedFile == null) {
      Get.snackbar(
        'Validation Error',
        'Please add a description or upload a file',
      );
      return;
    }

    isLoading.value = true;

    final request = TakeSurveyRequestModel(
      survey: surveyId,
      description: textController.text.isNotEmpty ? textController.text : null,
      file: selectedFile?.path != null ? File(selectedFile!.path!) : null,
    );

    final result = await repository.takeSurveys(request: request);

    isLoading.value = false;

    result.fold(
      (error) {
        Get.snackbar('Error', error.uiMessage);
      },
      (success) {
        Get.snackbar('Success', success.message);
        Get.back();
      },
    );
  }
}
