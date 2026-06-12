import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/failure.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/validation.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/login_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ProcessStatusNotifier processStatusNotifier = ProcessStatusNotifier(
    initialStatus: DisabledStatus(),
  );
  final SnackbarNotifier snackbarNotifier;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = false.obs;
  final keepSignedIn = false.obs;
  final isLoading = false.obs;

  String _email = '';
  String get email => _email;

  String _password = '';
  String get password => _password;

  LoginController(this.snackbarNotifier);

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      debugPrint("Email: ${emailController.text}");
      email = emailController.text.trim();
    });
    passwordController.addListener(() {
      debugPrint("password: ${passwordController.text}");
      password = passwordController.text.trim();
    });
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  set email(String value) {
    if (value != _email) {
      _email = value;
      canLogin();
    }
  }

  set password(String value) {
    if (value != _password) {
      _password = value;
      canLogin();
    }
  }

  void canLogin() {
    if (_email.isNotEmpty && isEmail(_email) && _password.isNotEmpty) {
      processStatusNotifier.setEnabled();
    } else {
      processStatusNotifier.setDisabled();
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleKeepSignedIn(bool value) {
    keepSignedIn.value = value;
  }

  Future<void> login({
    required GlobalKey<FormState> formKey,
    required VoidCallback needVerifyAccount,
  }) async {
  if (!formKey.currentState!.validate()) return;

  processStatusNotifier.setLoading();
  isLoading.value = true;

  try {
    final lr = await Get.find<AuthInterface>().login(
      LoginModel(email: emailController.text.trim(), password: passwordController.text.trim()),
    );

    handleFold(
      either: lr,
      processStatusNotifier: processStatusNotifier,
      successSnackbarNotifier: snackbarNotifier,
      errorSnackbarNotifier: snackbarNotifier,
      onSuccess: (success) {
        processStatusNotifier.setSuccess();
      },
      onError: (error) {
        if (error.failure == Failure.forbidden) {
          needVerifyAccount();
        }
        processStatusNotifier.setError();
        Future.delayed(const Duration(seconds: 1), () {
          processStatusNotifier.setEnabled();
        });
      },
    );
  } catch (e) {
    processStatusNotifier.setError();
    snackbarNotifier.notifyError(message: e.toString());
    Future.delayed(const Duration(seconds: 1), () {
      processStatusNotifier.setEnabled();
    });
  } finally {
    isLoading.value = false;
  }
}

}
