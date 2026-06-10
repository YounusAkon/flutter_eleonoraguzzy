import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/app/app_manager.dart';
import 'package:flutter_eleonoraguzzy/core/di/external_service_di.dart';
import 'package:flutter_eleonoraguzzy/core/di/internal_service_di.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_theme.dart';
import 'package:flutter_eleonoraguzzy/features/auth/presentation/widgets/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  externalServiceDI();
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppManager appManager;

  @override
  void initState() {
    super.initState();
    appManager = Get.put(AppManager());
    appManager.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: SplashView(),
      // home: Onboarding1Screen(),
    );
  }
}
