import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/subscription_plan.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_gap.dart';
import 'package:flutter_eleonoraguzzy/core/theme/text_style.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/get_profile_controller.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/change_password_screen.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/about_app_screen.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/privacy_policy.dart';
import 'package:flutter_eleonoraguzzy/features/tender/screen/tender_screen.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/terms_condition_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put<ProfileController>(
    ProfileController(),
  );

  @override
  void initState() {
    super.initState();
    controller.getCurrentUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F6FF),
        elevation: 0,
        title: Obx(() {
          final profile = controller.profile.value;
          return Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: profile?.avatarUrl?.isNotEmpty == true
                    ? NetworkImage(profile!.avatarUrl!)
                    : const AssetImage("assets/images/profile.png")
                          as ImageProvider,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: AppText.mdRegular_16_400.copyWith(
                      color: AppColors.primaryTextblack,
                    ),
                  ),
                  Text(
                    profile?.name ?? "Guest User",
                    style: AppText.xxlSemiBold_24_600.copyWith(
                      color: AppColors.primaryTextblack,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      _buildMenuItem(
                        "assets/icons/profile_icon.png",
                        "My Profile",
                        "Update your personal information",
                        () => Get.to(() => EditProfileScreen()),
                      ),
                      _buildMenuItem(
                        "assets/icons/change_password.png",
                        "Change Password",
                        "Update your login password",
                        () => Get.to(() => ChangePasswordScreen()),
                      ),
                      _buildMenuItem(
                        "assets/icons/tender.png",
                        "Tender",
                        "Manage your plan and billing",
                        () => Get.to(() => TenderScreen()),
                      ),
                      _buildMenuItem(
                        "assets/icons/subscription.png",
                        "Subscription",
                        "Manage your plan and billing",
                        () => Get.to(() => SubscriptionPlan()),
                      ),
                      _buildMenuItem(
                        "assets/icons/lock.png",
                        "Privacy Policy",
                        "How we handle your data",
                        () => Get.to(() => Privacypolicy()),
                      ),
                      _buildMenuItem(
                        "assets/icons/t&c.png",
                        "Terms & Conditions",
                        "App usage terms and conditions",
                        () => Get.to(() => TermsConditionScreen()),
                      ),
                      _buildMenuItem(
                        "assets/icons/faq.png",
                        "About App",
                        "Get the information you need",
                        () => Get.to(() => AboutAppScreen()),
                      ),
                      _buildMenuItem1(Icons.logout, 'Logout', () {
                        showLogoutDialog(
                          onConfirm: () {
                          },
                        );
                      }),
                      _buildMenuItem1(
                        Icons.delete_forever,
                        'Delete Account',
                        () {
                          showDeleteAccountDialog(
                            onConfirm: () {
                              controller.deleteAccount(
                                snackbarNotifier: SnackbarNotifier(
                                  context: context,
                                ),
                              );
                            },
                          );
                        },
                        color: Colors.red,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMenuItem(
    String imagePath,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem1(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLast = false,
    Color color = Colors.lightBlue,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            Gap.w16,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showLogoutDialog({required VoidCallback onConfirm}) {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    title: "Logout",
    middleText: "Are you sure you want to logout?",
    titleStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    middleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
    barrierDismissible: true,
    radius: 16,
    contentPadding: const EdgeInsets.all(20),
    cancel: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      ),
      onPressed: () {
      },
      child: const Text("Cancel"),
    ),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      ),
      onPressed: () {
        Get.find<AuthInterface>().logout();
      },
      child: Text("Logout"),
    ),
  );
}

void showDeleteAccountDialog({required VoidCallback onConfirm}) {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    title: "Delete Account",
    middleText:
        "Are you sure you want to delete your account? This action cannot be undone.",
    titleStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    middleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
    barrierDismissible: true,
    radius: 16,
    contentPadding: const EdgeInsets.all(20),
    cancel: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      ),
      onPressed: () {
        Get.back();
      },
      child: const Text("Cancel"),
    ),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
      ),
      onPressed: () {
        Get.back();
        onConfirm();
      },
      child: const Text("Delete"),
    ),
  );
}
