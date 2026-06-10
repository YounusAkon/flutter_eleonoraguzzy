// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_eleonoraguzzy/app/app_manager.dart';
// import 'package:app_pigeon/app_pigeon.dart';// import 'package:flutter_eleonoraguzzy/features/auth/presentation/screens/login_screen.dart';
// import 'package:flutter_eleonoraguzzy/features/nabber_screen.dart';
// import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';
// import 'package:get/get.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   late Timer timer;

//   @override
//   void initState() {
//     super.initState();
//     timer = Timer(const Duration(milliseconds: 1000), _navigateNext);
//   }

//   void _navigateNext() {
//     final appManager = Get.find<AppManager>();

//     if (appManager.currentAuthStatus is Authenticated) {
//       // User is logged in → go to AppGround
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AppGround()),
//       );
//     } else {
//       // User not logged in → go to Login screen
//       Navigator.push(context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: AppLogo()));
//   }
// }
