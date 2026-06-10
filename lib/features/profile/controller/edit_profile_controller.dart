import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/get_profile_controller.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/edit_profile_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/service/profile_repo.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  ProfileEditController();
  ProcessStatusNotifier processStatusNotifier = ProcessStatusNotifier(
    initialStatus: EnabledStatus(),
  );

  final TextEditingController nameController = TextEditingController();

  final Rx<File?> pickedImage = Rx<File?>(null);

  final ProfileController profileController = Get.find<ProfileController>();

  // void onInit() {
  //   super.onInit();
  //   final profile = profileController.profile.value;
  //   if (profile != null) {
  //     nameController.text = profile.name ?? '';
  //   }
  // }
  void pickImage(File image) {
    pickedImage.value = image;
  }

  Future<void> updateProfile({SnackbarNotifier? snackbarNotifier}) async {
    processStatusNotifier.setLoading();

    final result = await Get.find<ProfilInterface>().updateProfile(
      EditProfileModel(
        name: nameController.text.trim(),
        avatarFile: pickedImage.value,
        // avatarUrl: pickedImage.value?.path,
      ),
    );

    handleFold(
      either: result,
      successSnackbarNotifier: snackbarNotifier,
      errorSnackbarNotifier: snackbarNotifier,
      processStatusNotifier: processStatusNotifier,
    );

    // if (processStatusNotifier is SuccessStatus) {
    //   await profileController.getCurrentUserProfile();
    // }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
