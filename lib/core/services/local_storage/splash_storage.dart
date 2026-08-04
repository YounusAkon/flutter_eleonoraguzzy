import 'package:shared_preferences/shared_preferences.dart';

/// Persists whether the app's Flutter splash screen has already been shown.
///
/// SharedPreferences is cleared when the app is uninstalled, so a reinstall
/// starts with a fresh splash-screen state.
class SplashStorage {
  static const _hasShownSplashKey = 'has_shown_splash';

  /// Returns `true` once, then records that the splash has been shown.
  static Future<bool> shouldShowSplash() async {
    final prefs = await SharedPreferences.getInstance();
    final hasShownSplash = prefs.getBool(_hasShownSplashKey) ?? false;

    if (hasShownSplash) return false;

    await prefs.setBool(_hasShownSplashKey, true);
    return true;
  }
}
