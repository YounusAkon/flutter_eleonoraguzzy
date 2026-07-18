import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/create_new_password_controller.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/app_gradient.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/textfield.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email, required this.otp});
  final String email;
  final String otp;

  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordController controller = Get.put(
      CreateNewPasswordController(email: email, otp: otp),
    );
    final SnackbarNotifier snackbarNotifier = SnackbarNotifier(
      context: context,
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: AppGradient.withGradientBackground(child: Container()),
          ),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 32,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: AppSizes.screenPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
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
                                "Welcome to Voce",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16),
                              LabeledTextField(
                                title: "Password",
                                hintText: "Enter your Password",
                                isPassword: true,
                                onChanged: (value) =>
                                    controller.newPassword = value,
                              ),
                              SizedBox(height: 16),
                              LabeledTextField(
                                title: "Confirm Password",
                                hintText: "Confirm your Password",
                                isPassword: true,
                                onChanged: (value) =>
                                    controller.confirmPassword = value,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: RSaveButton(
                              buttonStatusNotifier: controller.processNotifier,
                              saveText: "Reset Password",
                              loadingText: "Resetting...",
                              doneText: "Done",
                              onSaveTap: () {
                                controller.resetPassword(snackbarNotifier);
                              },
                              onDone: () {},
                              key: null,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Get.offAll(() => const LoginScreen()),
                            child: const Text(
                              "Back to Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
