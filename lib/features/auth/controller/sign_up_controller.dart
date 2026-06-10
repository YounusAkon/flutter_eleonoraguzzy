import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/signup_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import '../../../core/notifiers/button_status_notifier.dart';
import '../../../core/notifiers/snackbar_notifier.dart';

class SignUpController extends GetxController {
  final ProcessStatusNotifier processNotifier =
      ProcessStatusNotifier(initialStatus: EnabledStatus());
  SnackbarNotifier? snackbarNotifier;

  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final keepSignedIn = false.obs;

  // Observables
  final name = ''.obs;
  final email = ''.obs;
  final phoneNumber = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleKeepSignedIn(bool value) {
    keepSignedIn.value = value;
  }

  // --- Create model ---
  SignupModel get signupModel => SignupModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim().isEmpty
            ? null
            : phoneController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );

  // --- Example signup method ---
  Future<void> signup({
    required GlobalKey<FormState> formKey,
    required SnackbarNotifier snackbarNotifier,
  }) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    processNotifier.setLoading();

    final lr = await Get.find<AuthInterface>().signup(signupModel);

    handleFold(
      either: lr,
      errorSnackbarNotifier: snackbarNotifier,
      successSnackbarNotifier: snackbarNotifier,
      onError: (failure) {
        processNotifier.setError();
        Future.delayed(const Duration(seconds: 1), () {
          processNotifier.setEnabled();
        });
      },
      onSuccess: (success) {
        Get.back();
      },
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
