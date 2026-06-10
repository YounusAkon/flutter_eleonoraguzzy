import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/change_password_controller.dart';
import '../../../../core/theme/text_style.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late final ChangePasswordController _changePasswordController;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();

    _changePasswordController = ChangePasswordController(
      SnackbarNotifier(context: context),
    );

    // Text field listeners to update controller values
    currentPasswordController.addListener(() {
      _changePasswordController.currentPassword = currentPasswordController.text
          .trim();
    });
    newPasswordController.addListener(() {
      _changePasswordController.newPassword = newPasswordController.text.trim();
    });
    confirmNewPasswordController.addListener(() {
      _changePasswordController.confirmPassword = confirmNewPasswordController
          .text
          .trim();
    });
  }

  InputBorder get inputBorder => OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryTextblack),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F6FF),
        centerTitle: false,
        title: Text(
          'Change Password',
          style: AppText.xlSemiBold_20_600.copyWith(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildPasswordField(
                  controller: currentPasswordController,
                  hintText: "Current Password",
                  obscureText: !_showCurrentPassword,
                  onToggleVisibility: () {
                    setState(() {
                      _showCurrentPassword = !_showCurrentPassword;
                    });
                  },
                ),
                _buildPasswordField(
                  controller: newPasswordController,
                  hintText: "New Password",
                  obscureText: !_showNewPassword,
                  onToggleVisibility: () {
                    setState(() {
                      _showNewPassword = !_showNewPassword;
                    });
                  },
                ),
                _buildPasswordField(
                  controller: confirmNewPasswordController,
                  hintText: "Confirm Password",
                  obscureText: !_showConfirmPassword,
                  onToggleVisibility: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                ),
                const SizedBox(height: 30),

                SizedBox(
                  height: 52,
                  child: RSaveButton(
                    key: UniqueKey(),
                    width: double.infinity,
                    height: 52,
                    buttonStatusNotifier:
                        _changePasswordController.processNotifier,
                    saveText: "Save",
                    loadingText: "Saving...",
                    doneText: "Done",
                    onDone: () {
                      Navigator.pop(context);
                    },
                    onSaveTap: () {
                      if (_formKey.currentState!.validate()) {
                        _changePasswordController.changePassword(
                          snackbarNotifier: _changePasswordController.snackbarNotifier,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    const borderColor = Color(0xFF97BBD3);

    OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: borderColor, width: 1.5),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hintText cannot be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder.copyWith(
            borderSide: const BorderSide(color: borderColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 24,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: onToggleVisibility,
          ),
        ),
      ),
    );
  }
}
