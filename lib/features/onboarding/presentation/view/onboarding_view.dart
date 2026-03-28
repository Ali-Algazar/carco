import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:carco/features/onboarding/presentation/view/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(body: SafeArea(child: OnboardingViewBody())),
    );
  }
}
