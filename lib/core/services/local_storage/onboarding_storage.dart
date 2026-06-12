import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Tracks whether the onboarding flow has been shown to the user.
///
/// Onboarding should only be shown once, on the very first app launch.
class OnboardingStorage {
  static const _hasSeenOnboardingKey = 'has_seen_onboarding';

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<bool> hasSeenOnboarding() async {
    final value = await _storage.read(key: _hasSeenOnboardingKey);
    return value == 'true';
  }

  static Future<void> setOnboardingSeen() async {
    await _storage.write(key: _hasSeenOnboardingKey, value: 'true');
  }
}
