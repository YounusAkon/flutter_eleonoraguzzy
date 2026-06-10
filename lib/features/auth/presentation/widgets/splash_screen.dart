import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/app_gradient.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradient.withGradientBackground(child: Center(child: AppLogo())),
    );
  }
}
