import 'package:carco/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:carco/features/auth/presentation/cubit/auth_state.dart';
import 'package:carco/features/main/presentation/view/main_view.dart';
import 'package:carco/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    scale = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.repeat(reverse: true);
  }

  void navigateToNextView(String routeName) {
    Future.delayed(const Duration(milliseconds: 3100), () {
      controller.stop();

      Navigator.pushReplacementNamed(context, routeName);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          navigateToNextView(MainView.routeName);
        }
        if (state is AuthError) {
          navigateToNextView(OnboardingView.routeName);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: scale,
              child: Container(
                width: 326,
                height: 155,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
