import 'dart:async';
import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/auth_role.dart';
import 'package:flutter_eleonoraguzzy/core/services/local_storage/onboarding_storage.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_eleonoraguzzy/features/nabber_screen.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/onboarding1.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/get_profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
// class AppManager extends GetxController {
//   AuthStatus _authStatus = AuthLoading();
//   AuthStatus get currentAuthStatus => _authStatus;
//   Debouncer authDebouncer = Debouncer(delay: const Duration(milliseconds: 100));

//   /// Initializes the stream to listen to auth status
//   AppManager() {
//     _init();
//   }

//   // listen to auth change
//   void _init() async {
//     debugPrint("AppManager initialized");

//     await Get.find<AppPigeon>().currentAuth().then((initialAuthStatus) {
//       _decideRoute(initialAuthStatus);
//     });

//     // Start listening to the auth status changes
//   }

//   void _decideRoute(AuthStatus? authStatus) async {
//     if (authStatus is UnAuthenticated) {
//       _authStatus = authStatus;
//       Get.to(() => SignupScreen());
//       // navigatorKey.currentState?.pushNamedAndRemoveUntil(
//       //   RouteNames.login,
//       //   (route) => false,
//       // );
//     } else if (authStatus is Authenticated) {
//       debugPrint(
//         "currentAuthStatus: $_authStatus, beforeAuthStatus: $authStatus",
//       );
//       debugPrint(
//         "New auth:: ${!(currentAuthStatus is Authenticated && (authStatus).auth.userId != (currentAuthStatus as Authenticated).auth.userId)}",
//       );
//       _authStatus = authStatus;
//       await _initializeControllers();
//       if (Get.isRegistered<ProfileController>()) {
//         Get.delete<ProfileController>();
//       }
//       Get.put(ProfileController( ));
//       Get.to(() => AppGround());

//       // navigatorKey.currentState?.pushNamedAndRemoveUntil(
//       //   RouteNames.home,
//       //   (route) => false,
//       // );
//     }
//     update();
//     // if (authStatus != null && authStatus != _authStatus) {
//     //   debugPrint("(In Appmanager)Auth status: $authStatus");

//     // }
//   }

//   // initiate controllers on auth change[Authenticated]
//   Future<void> _initializeControllers() async {
//     if ((currentAuthStatus as Authenticated).auth.userId.isNotEmpty) {
//       await Get.find<AppPigeon>()
//           .socketInit(
//             SocketConnetParamX(
//               token: null,
//               socketUrl: ApiEndpoints.socketUrl,
//               joinId: (currentAuthStatus as Authenticated).auth.userId,
//             ),
//           )
//           .then((_) async {
//             Get.find<AppPigeon>().emit(
//               "join",
//               ((currentAuthStatus as Authenticated).auth.userId),
//             );
//             // if (Get.isRegistered<AppGlobalControllers>()) {
//             //   await Get.delete<AppGlobalControllers>();
//             // }

//             // Get.put<AppGlobalControllers>(
//             //   AppGlobalControllers(),
//             // );
//           });
//     }
//   }
// }
class AppManager extends GetxController {
  AuthStatus _authStatus = AuthLoading();
  AuthStatus get currentAuthStatus => _authStatus;

  bool _onboardingChecked = false;

  final Debouncer authDebouncer = Debouncer(
    delay: const Duration(milliseconds: 100),
  );

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    debugPrint("AppManager initialized");

    // final initialAuthStatus = await Get.find<AppPigeon>().currentAuth();

    // ✅ WAIT until UI is ready
    Get.find<AppPigeon>().authStream.listen((authstatus) {
      debugPrint("authstatus is::: $authstatus");
      _decideRoute(authstatus);
    });
  }

  /// Called by the onboarding flow once the user finishes (or skips) it.
  /// Marks onboarding as seen and routes to the screen matching the
  /// current auth status.
  Future<void> completeOnboarding() async {
    await OnboardingStorage.setOnboardingSeen();
    _onboardingChecked = true;
    await _decideRoute(_authStatus);
  }

  Future<void> _decideRoute(AuthStatus? authStatus) async {
    if (authStatus == null || authStatus is AuthLoading) return;

    _authStatus = authStatus;

    // Show onboarding only on the very first app launch.
    if (!_onboardingChecked) {
      _onboardingChecked = true;

      final hasSeenOnboarding = await OnboardingStorage.hasSeenOnboarding();
      if (!hasSeenOnboarding) {
        Get.offAll(() => const Onboarding1Screen());
        update();
        return;
      }
    }

    if (authStatus is UnAuthenticated) {
      Get.offAll(() => LoginScreen());
    } else if (authStatus is Authenticated) {
      debugPrint("Delegating to Homeview");

      await _initializeControllers();

      if (Get.isRegistered<ProfileController>()) {
        Get.delete<ProfileController>();
      }

      Get.put(ProfileController());

      Get.offAll(() => AppGround());
    }

    update();
  }

  Future<void> _initializeControllers() async {
    if (_authStatus is! Authenticated) return;

    final userId = (_authStatus as Authenticated).auth.userId;

    if (userId.isEmpty) return;

    await Get.find<AppPigeon>().socketInit(
      SocketConnetParamX(
        token: null,
        socketUrl: ApiEndpoints.socketUrl,
        joinId: userId,
      ),
    );

    Get.find<AppPigeon>().emit("join", userId);
  }
}
