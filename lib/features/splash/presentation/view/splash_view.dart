import 'package:flutter/material.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      body: SplashViewBody(),
    );
  }
}
