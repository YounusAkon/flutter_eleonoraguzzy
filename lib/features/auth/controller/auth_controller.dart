import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';

class AuthController extends GetxController {
  final AuthInterface authRepo;

  AuthController(this.authRepo);

  final isLoading = false.obs;

  Future<void> logout() async {
    if (isLoading.value) return;

    isLoading.value = true;

    final result = await authRepo.logout();

    result.fold(
      (failure) {
        isLoading.value = false;
        Get.snackbar(
          "Logout Failed",
          failure.uiMessage,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (success) async {
        isLoading.value = false;

        /// Clear local auth/session (VERY IMPORTANT)
        await _clearAuthData();

        /// Navigate to login screen
        Get.offAllNamed('/login');

        Get.snackbar(
          "Logged Out",
          success.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> _clearAuthData() async {
    /// Example:
    /// await Get.find<AppPigeon>().clearAuth();
    /// OR
    /// await SecureStorage.clear();
  }
}
