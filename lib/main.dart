import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eleonoraguzzy/app/app_manager.dart';
import 'package:flutter_eleonoraguzzy/core/di/external_service_di.dart';
import 'package:flutter_eleonoraguzzy/core/di/internal_service_di.dart';
import 'package:flutter_eleonoraguzzy/core/services/local_storage/fresh_install_guard.dart';
import 'package:flutter_eleonoraguzzy/core/services/local_storage/splash_storage.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_theme.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/widgets/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _hideAndroidNavigationBar();
  await FreshInstallGuard.clearStaleDataOnFreshInstall();
  final shouldShowSplash = await SplashStorage.shouldShowSplash();
  externalServiceDI();
  initServices();
  runApp(MyApp(showSplash: shouldShowSplash));
}

Future<void> _hideAndroidNavigationBar() {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return Future<void>.value();
  }

  // Keep the status bar visible, but hide Android's bottom navigation
  // buttons. Android may restore them after a system gesture, so this is
  // called again whenever the app returns to the foreground.
  return SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: const [SystemUiOverlay.top],
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.showSplash = false});

  final bool showSplash;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final AppManager appManager;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // AppManager is registered and initialized by initServices(). Do not
    // call onInit again here, otherwise authStream gets two listeners.
    appManager = Get.find<AppManager>();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(_hideAndroidNavigationBar());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: widget.showSplash ? const SplashView() : const SizedBox.shrink(),
      // home: Onboarding1Screen(),
    );
  }
}
