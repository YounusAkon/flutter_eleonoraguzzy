import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// On iOS, Keychain entries (used by [FlutterSecureStorage]) survive app
/// uninstall/reinstall, while SharedPreferences/NSUserDefaults data does not.
///
/// This means flags like "has seen onboarding" and even a saved login
/// session can silently persist across a fresh install.
///
/// Call [clearStaleDataOnFreshInstall] once at app startup. It uses a
/// SharedPreferences marker (which is wiped on uninstall) to detect a fresh
/// install and, when detected, clears any leftover secure storage data so
/// the app behaves like a true first launch.
class FreshInstallGuard {
  static const _installedKey = 'app_installed';

  static Future<void> clearStaleDataOnFreshInstall() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyInstalled = prefs.getBool(_installedKey) ?? false;

    if (!alreadyInstalled) {
      await const FlutterSecureStorage().deleteAll();
      await prefs.setBool(_installedKey, true);
    }
  }
}
