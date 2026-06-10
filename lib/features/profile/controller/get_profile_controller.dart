import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/get_profile_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/service/profile_repo.dart';
import 'package:flutter_eleonoraguzzy/app/app_manager.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/auth_role.dart';

class ProfileController extends GetxController {
  final ProfilInterface repo = Get.find<ProfilInterface>();

  final Rxn<ProfileModel> profile = Rxn<ProfileModel>();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentUserProfile();
  }

  Future<void> getCurrentUserProfile() async {
    final app = Get.find<AppManager>();
    if (app.currentAuthStatus is! Authenticated) {
      debugPrint("User not authenticated");
      return;
    }

    final auth = app.currentAuthStatus as Authenticated;
    final userId = auth.auth.userId;

    isLoading.value = true;

    debugPrint("Fetching profile for user: $userId");

    final result = await repo.getProfile(userId);

    result.fold(
      (failure) {
        debugPrint("PROFILE ERROR: $failure");
      },
      (success) {
        debugPrint("PROFILE LOADED: ${success.data?.name}");
        profile.value = success.data;
      },
    );

    isLoading.value = false;
  }

  Future<void> deleteAccount({
    required SnackbarNotifier snackbarNotifier,
  }) async {
    final app = Get.find<AppManager>();
    if (app.currentAuthStatus is! Authenticated) {
      debugPrint("User not authenticated");
      return;
    }

    isLoading.value = true;

    final result = await repo.deleteAccount();

    handleFold(
      either: result,
      errorSnackbarNotifier: snackbarNotifier,
      onSuccess: (_) async {
        await Get.find<AppPigeon>().logOut();
      },
    );

    isLoading.value = false;
  }
}
