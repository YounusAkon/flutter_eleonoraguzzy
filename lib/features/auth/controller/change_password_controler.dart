import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/change_password.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final ProcessStatusNotifier processNotifier = ProcessStatusNotifier();
  final SnackbarNotifier snackbarNotifier;
  

  ChangePasswordController(this.snackbarNotifier);

  String _oldPass = '';
  String _newPass = '';
  String _confirmPass = '';

  set currentPassword(String value) {
    _oldPass = value;
    _validate();
  }

  set newPassword(String value) {
    _newPass = value;
    _validate();
  }

  set confirmPassword(String value) {
    _confirmPass = value;
    _validate();
  }

  void _validate() {
    if (_oldPass.isNotEmpty &&
        _newPass.isNotEmpty &&
        _newPass.length >= 6 &&
        _confirmPass == _newPass) {
      processNotifier.setEnabled();
    } else {
      processNotifier.setDisabled();
    }
  }

  Future<void> changePassword() async {
    processNotifier.setLoading();

    final param = ChangePasswordModel(
      oldPassword: _oldPass,
      newPassword: _newPass,
    );

    final result = await Get.find<AuthInterface>().changePassword(param);

    result.fold(
      (failure) {
        processNotifier.setError();
        snackbarNotifier.notifyError(message: failure.uiMessage);
      },
      (success) {
        processNotifier.setSuccess(message: success.message);
        snackbarNotifier.notifySuccess(message: success.message);
        Future.delayed(const Duration(milliseconds: 600), () {
          Get.back();
        });
      },
    );
  }
}
 