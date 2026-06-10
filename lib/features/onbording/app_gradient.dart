import 'package:flutter/material.dart';

class AppGradient {
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // colors: [Color(0xFF0071C0), Color(0xFFA1BFE5), Color(0xFF99335A)],
    colors: [Color(0xFF0071C0), Color(0xFF99335A)],
    stops: [0.1, .999],
  );
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFF6A11CB),
      fontFamily: 'notoSans',
    );
  }

  static Widget withGradientBackground({required Widget child}) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.primaryGradient),
      child: child,
    );
  }
}
