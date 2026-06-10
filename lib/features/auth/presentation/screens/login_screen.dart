import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/forget_password.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter_eleonoraguzzy/features/nabber_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/app_gradient.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/textfield.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/login_controller.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(LoginController(SnackbarNotifier(context: context)));
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = _controller;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppGradient.withGradientBackground(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
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
                            SizedBox(height: 20),
                            const Text(
                              "Welcome to Voce",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
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

                            Obx(
                              () => LabeledTextField(
                                title: "Password",
                                hintText: "Enter your password",
                                controller: controller.passwordController,
                                isPassword: !controller.isPasswordVisible.value,
                                prefixIcon: Icons.lock_outline,
                                prefixIconColor: Colors.grey,
                                prefixIconSize: 28,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  if (value.length < 6) {
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: controller.keepSignedIn.value,
                                    activeColor: AppColors.primarybutton,
                                    onChanged: (bool? value) {
                                      controller.toggleKeepSignedIn(
                                        value ?? false,
                                      );
                                    },
                                  ),
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgetPassword(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      color: AppColors.primarybutton,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),

                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: RSaveButton(
                                saveText: "Sign in",
                                loadingText: "Signing in...",
                                doneText: "Signed in",
                                errorText: "Sign in failed",
                                key: null,
                                buttonStatusNotifier:
                                    controller.processStatusNotifier,
                                onSaveTap: () {
                                  controller.login(
                                    formKey: _formKey,
                                    needVerifyAccount: () {
                                      controller.snackbarNotifier;
                                    },
                                  );
                                },

                                onDone: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppGround(),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign up Here",
                                    style: TextStyle(
                                      color: AppColors.primarybutton,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 4),
                            // Row(
                            //   children: [
                            //     const Expanded(
                            //       child: Divider(
                            //         color: Colors.grey,
                            //         thickness: 2,
                            //         endIndent: 10,
                            //       ),
                            //     ),
                            //     const Text(
                            //       "or continue with",
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     ),
                            //     const Expanded(
                            //       child: Divider(
                            //         color: Colors.grey,
                            //         thickness: 2,
                            //         indent: 10,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(height: 30),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     InkWell(
                            //       onTap: () {
                            //         print("object");
                            //       },
                            //       borderRadius: BorderRadius.circular(8),
                            //       child: Container(
                            //         height: 50,
                            //         width: 50,
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(8),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.black.withOpacity(0.1),
                            //               blurRadius: 4,
                            //               offset: Offset(0, 2),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(12.0),
                            //           child: Image.asset(
                            //             "assets/icons/google.png",
                            //             fit: BoxFit.contain,
                            //           ),
                            //         ),
                            //       ),
                            //     ),

                            //     SizedBox(width: 16),
                            //     InkWell(
                            //       onTap: () {
                            //         print("object");
                            //       },
                            //       borderRadius: BorderRadius.circular(8),
                            //       child: Container(
                            //         height: 50,
                            //         width: 50,
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(8),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.black.withOpacity(0.1),
                            //               blurRadius: 4,
                            //               offset: Offset(0, 2),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(12),
                            //           child: Image.asset(
                            //             "assets/icons/apple.png",
                            //             fit: BoxFit.contain,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
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
