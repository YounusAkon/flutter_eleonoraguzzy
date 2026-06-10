import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/verify_account_view_controller.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/reset_password.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/app_gradient.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:get/get.dart';

class EnterOtp extends StatefulWidget {
  final String email;
  const EnterOtp({super.key, required this.email});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());
  final Color _brandBlue = AppColors.primarybutton;

  late final VerifyForgetPasswordOtpController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with email and snackbar
    controller = Get.put(
      VerifyForgetPasswordOtpController(
        email: widget.email,
        snackbarNotifier: SnackbarNotifier(context: context),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in _otpControllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onChanged(int index, String value) {
    controller.otp = _otpControllers.map((c) => c.text).join();
    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  void _onBackspace(int index, RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _otpControllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppGradient.withGradientBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const AppLogo(),
                        const SizedBox(height: 16),
                        const Text(
                          "Your City, Your Voice Matter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Enter OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "OTP sent to ${widget.email}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (i) {
                            return Padding(
                              padding: EdgeInsets.only(right: i == 5 ? 0 : 12),
                              child: SizedBox(
                                width: 45,
                                height: 60,
                                child: RawKeyboardListener(
                                  focusNode: FocusNode(skipTraversal: true),
                                  onKey: (e) => _onBackspace(i, e),
                                  child: TextField(
                                    controller: _otpControllers[i],
                                    focusNode: _focusNodes[i],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    textInputAction: i == 5
                                        ? TextInputAction.done
                                        : TextInputAction.next,
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.zero,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: _brandBlue,
                                          width: 1.6,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: _brandBlue,
                                          width: 1.6,
                                        ),
                                      ),
                                    ),
                                    onChanged: (v) => _onChanged(i, v),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 40),
                        RSaveButton(
                          height: 52,
                          key: UniqueKey(),
                          buttonStatusNotifier: controller.prcessNotifier,
                          saveText: "Verify OTP",
                          loadingText: "Verifying OTP...",
                          doneText: "OTP Sent",
                          onDone: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPassword(
                                  email: widget.email,
                                  otp: controller.otp,
                                ),
                              ),
                            );
                          },
                          onSaveTap: () {
                            controller.verify();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
