import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/forget_password_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final ProcessStatusNotifier processNotifier = ProcessStatusNotifier(
    initialStatus: EnabledStatus(),
  );

  final SnackbarNotifier snackbarNotifier;

  final TextEditingController emailController = TextEditingController();

  ForgetPasswordController({required this.snackbarNotifier});

  String get email => emailController.text.trim();

  Future<void> forgetPassword({
    required ProcessStatusNotifier? buttonNotifier,
    required SnackbarNotifier? snackbarNotifier,
  }) async {
    buttonNotifier?.setLoading();

    final result = await Get.find<AuthInterface>().forgetpassword(
      ForgetPasswordModel(email: email),
    );

    handleFold(
      either: result,
      processStatusNotifier: buttonNotifier,
      successSnackbarNotifier: snackbarNotifier,
      errorSnackbarNotifier: snackbarNotifier,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
