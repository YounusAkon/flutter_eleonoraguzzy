import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/change_password.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:get/get.dart';

class ChangePasswordController extends ChangeNotifier {
  final ProcessStatusNotifier processNotifier = ProcessStatusNotifier();
  final SnackbarNotifier snackbarNotifier;

  ChangePasswordController(this.snackbarNotifier);

  String _currentPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  String get password => _currentPassword;
  String get newPassword => _newPassword;
  String get confirmPassword => _confirmPassword;

  set currentPassword(String value) {
    if (value != _currentPassword) {
      _currentPassword = value;
      _validateForm();
    }
  }

  set newPassword(String value) {
    if (value != _newPassword) {
      _newPassword = value;
      _validateForm();
    }
  }

  set confirmPassword(String value) {
    if (value != _confirmPassword) {
      _confirmPassword = value;
      _validateForm();
    }
  }

  /// Validate fields before enabling Save button
  void _validateForm() {
    if (_currentPassword.isNotEmpty &&
        _newPassword.isNotEmpty &&
        _newPassword.length >= 6 &&
        _confirmPassword.isNotEmpty &&
        _newPassword == _confirmPassword) {
      processNotifier.setEnabled();
    } else {
      processNotifier.setDisabled();
    }
    notifyListeners();
  }

  Future<void> changePassword({required SnackbarNotifier? snackbarNotifier}) async {
    processNotifier.setLoading();
    Future.delayed(const Duration(seconds: 1)).then((_) async{
      await Get.find<AuthInterface>()
      .changePassword(ChangePasswordModel(
        oldPassword: _currentPassword,
        newPassword: _newPassword,
      ))
      .then((lr) {
          handleFold(
            either: lr,
            processStatusNotifier: processNotifier,
            successSnackbarNotifier: snackbarNotifier,
          );
      });
    });
  }
}