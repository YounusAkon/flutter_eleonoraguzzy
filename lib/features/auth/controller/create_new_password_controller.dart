import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/create_new_password_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final String email;
  final String otp;
  CreateNewPasswordController({required this.email, required this.otp});
  final ProcessStatusNotifier processNotifier = ProcessStatusNotifier(
    initialStatus: DisabledStatus()
  );

  // validation flags
  RxBool lenOk = RxBool(false);
  RxBool upperOk = RxBool(false);
  RxBool lowerOk = RxBool(false);
  RxBool numOk = RxBool(false);
  RxBool specialOk = RxBool(false);
  RxBool matchOk = RxBool(false);

  String _newPassword = '';
  String get newPassword => _newPassword;
  set newPassword(String value) {
    _newPassword = value;
    debugPrint("New Password: $_newPassword");
    recompute();
    if(matchOk.value){
      processNotifier.setEnabled();
    } else {
      processNotifier.setDisabled();
    }
  }

  String _confirmPassword = '';
  String get confirmPassword => _confirmPassword;
  set confirmPassword(String value) {
    _confirmPassword = value;
    debugPrint("Confirm Password: $_confirmPassword");
    debugPrint("New Password: $_newPassword");
    recompute();
    if(matchOk.value){
      processNotifier.setEnabled();
    } else {
      processNotifier.setDisabled();
    }
  }


  void recompute() {
    final p = _newPassword;
    lenOk.value = p.length >= 8;
    upperOk.value = RegExp(r'[A-Z]').hasMatch(p);
    lowerOk.value = RegExp(r'[a-z]').hasMatch(p);
    numOk.value = RegExp(r'\d').hasMatch(p);
    specialOk.value = RegExp(r'[^A-Za-z0-9]').hasMatch(p);

    matchOk.value = _newPassword.isNotEmpty &&
        _confirmPassword.isNotEmpty &&
        _newPassword == _confirmPassword;
  }

  void resetPassword(SnackbarNotifier? snackbarNotifier) async {
    if (matchOk.value) {
      processNotifier.setEnabled();
    } else {
      processNotifier.setDisabled();
    }

    await Get.find<AuthInterface>()
        .createNewPassword(
          CreatePasswordModel(
            email: email,
            password: newPassword,
            otp: otp,
          ),
        )
        .then((lr) {
          handleFold(
            either: lr,
            processStatusNotifier: processNotifier,
            successSnackbarNotifier: snackbarNotifier,
            errorSnackbarNotifier: snackbarNotifier,
          );
        });
  }
}
