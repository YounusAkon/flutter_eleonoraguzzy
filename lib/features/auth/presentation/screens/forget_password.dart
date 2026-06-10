import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/forget_password%20controller.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/enter_otp.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/app_gradient.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/textfield.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller = Get.put(
      ForgetPasswordController(
        snackbarNotifier: SnackbarNotifier(context: context),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppGradient.withGradientBackground(
        child: SafeArea(
          child: Form(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          const AppLogo(),
                    
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
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    
                          const SizedBox(height: 16),
                    
                          const Text(
                            "Please enter your email to reset your password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    
                          const SizedBox(height: 16),
                          LabeledTextField(
                            title: "Email",
                            hintText: "Enter your email",
                            prefixIcon: Icons.email_outlined,
                            prefixIconColor: Colors.grey,
                            prefixIconSize: 28,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              if (!GetUtils.isEmail(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                    
                          const SizedBox(height: 24),
                          // SizedBox(
                          //   width: double.infinity,
                          //   height: 50,
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: AppColors.primarybutton,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(12),
                          //       ),
                          //     ),
                          //     onPressed: () async {
                          //       await controller.forgetPassword(
                          //         buttonNotifier: controller.processNotifier,
                          //         snackbarNotifier:
                          //             controller.snackbarNotifier,
                          //       );
                    
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => const EnterOtp(),
                          //         ),
                          //       );
                          //     },
                    
                          //     child: const Text(
                          //       "Send OTP",
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 16),
                          RSaveButton(
                            height: 52,
                            key: UniqueKey(),
                            buttonStatusNotifier: controller.processNotifier,
                            saveText: "Send OTP",
                            loadingText: "Sending OTP...",
                            doneText: "OTP Sent",
                            onDone: () {},
                            onSaveTap: () {
                              controller.forgetPassword(
                                buttonNotifier: controller.processNotifier,
                                snackbarNotifier:
                                    controller.snackbarNotifier,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterOtp(
                                    email: controller.emailController.text,),
                                ),
                              );
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
      ),
    );
  }
}
