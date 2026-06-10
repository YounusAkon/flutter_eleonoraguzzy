import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/app_gradient.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/textfield.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/sign_up_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late final SignUpController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(SignUpController());
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AppGradient.withGradientBackground(
        child: SizedBox.expand(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 80,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Full Name
                    LabeledTextField(
                      title: "Full Name",
                      hintText: "Enter your full name",
                      prefixIcon: Icons.person_outline,
                      controller: controller.nameController,
                      validator: (value) => value == null || value.isEmpty
                          ? "Enter your name"
                          : null,
                    ),

                    // Email
                    LabeledTextField(
                      title: "Email",
                      hintText: "Enter your email",
                      prefixIcon: Icons.email_outlined,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!GetUtils.isEmail(value)) {
                          return "Invalid email format";
                        }
                        return null;
                      },
                    ),

                    // Phone (optional)
                    // LabeledTextField(
                    //   title: "Phone Number (optional)",
                    //   hintText: "Enter your phone number",
                    //   prefixIcon: Icons.phone,
                    //   controller: controller.phoneController,
                    //   keyboardType: TextInputType.phone,
                    // ),

                    // Password
                    Obx(
                      () => LabeledTextField(
                        title: "Password",
                        hintText: "Enter your password",
                        controller: controller.passwordController,
                        isPassword: !controller.isPasswordVisible.value,
                        prefixIcon: Icons.lock_outline,
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

                    // Confirm Password
                    LabeledTextField(
                      title: "Confirm Password",
                      hintText: "Confirm your password",
                      controller: controller.confirmPasswordController,
                      isPassword: true,
                      prefixIcon: Icons.lock_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                        if (value != controller.passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Terms Checkbox
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: controller.keepSignedIn.value,
                            activeColor: AppColors.primarybutton,
                            onChanged: (value) =>
                                controller.toggleKeepSignedIn(value ?? false),
                          ),
                          Expanded(
                            child: Text(
                              "I agree to the Terms & Conditions and Privacy Policy",
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: RSaveButton(
                        saveText: "Sign up",
                        loadingText: "Signing up...",
                        doneText: "Signed up",
                        errorText: "Sign in failed",
                        key: null,
                        buttonStatusNotifier: controller.processNotifier,
                        onSaveTap: () {
                          controller.signup(
                            formKey: _formKey,
                            snackbarNotifier: SnackbarNotifier(
                              context: context,
                            ),
                          );
                        },

                        onDone: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Already Have Account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign in here",
                            style: TextStyle(
                              color: AppColors.primarybutton,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
