import 'package:flutter/foundation.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/handle_fold.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/verify_otp_param.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:get/get.dart';

abstract class VerifyOtpController extends ChangeNotifier {
  final AuthInterface authInterface = Get.find<AuthInterface>();
  final ProcessStatusNotifier prcessNotifier = ProcessStatusNotifier(
    initialStatus: DisabledStatus(),
  );
  final SnackbarNotifier snackbarNotifier;
  final String email;

  VerifyOtpController({required this.email, required this.snackbarNotifier});

  int otpLength = 6;
  String _otp = "";

  String get otp => _otp;

  set otp(String value) {
    _otp = value;
    debugPrint(_otp);
    if (_otp.length == 6) {
      prcessNotifier.setEnabled();
    } else {
      prcessNotifier.setDisabled();
    }
  }

  void verify();
}

class VerifyForgetPasswordOtpController extends VerifyOtpController {
  VerifyForgetPasswordOtpController({
    required super.email,
    required super.snackbarNotifier,
  });

  @override
  void verify() async {
    if (prcessNotifier.status is LoadingStatus) return;
    debugPrint("verifying...");
    prcessNotifier.setLoading();
    await authInterface.verifyCode(VerifyOtpParam(email: email, otp: otp)).then(
      (lr) {
        handleFold(
          either: lr,
          processStatusNotifier: prcessNotifier,
          successSnackbarNotifier: snackbarNotifier,
          errorSnackbarNotifier: snackbarNotifier,
        );
      },
    );
  }
}
