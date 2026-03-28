import 'package:carco/features/auth/presentation/view/login_view_body.dart';
import 'package:carco/features/onboarding/presentation/models/onboarding_model.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/core/widgets/custom_button.dart';
import 'package:carco/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:carco/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:carco/features/onboarding/presentation/view/widgets/custom_dots.dart';
import 'package:carco/features/onboarding/presentation/view/widgets/onboarding_item.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> pages = [
      OnboardingModel(
        title: S.of(context).onboarding1Title,
        description: S.of(context).onboarding1Desc,
        image: 'assets/images/onboarding1.png',
      ),
      OnboardingModel(
        title: S.of(context).onboarding2Title,
        description: S.of(context).onboarding2Desc,
        image: 'assets/images/onboarding2.png',
      ),
      OnboardingModel(
        title: S.of(context).onboarding3Title,
        description: S.of(context).onboarding3Desc,
        image: 'assets/images/onboarding3.png',
      ),
    ];

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        return Padding(
          padding: 24.horizontal,
          child: Column(
            children: [
              16.h,
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                  child: Text(
                    'تخطي',
                    style: AppTextStyles.textStyle16Medium.copyWith(
                      color: context.theme.colorScheme.onSurface.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: cubit.updateIndex,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return OnboardingItem(model: pages[index]);
                  },
                ),
              ),
              CustomDots(currentIndex: cubit.currentIndex),
              40.h,
              CustomButton(
                onTap: () {
                  if (cubit.currentIndex == pages.length - 1) {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  } else {
                    cubit.nextPage();
                  }
                },
                text: cubit.currentIndex == pages.length - 1
                    ? 'ابدأ الآن'
                    : 'التالي',
              ),
              40.h,
            ],
          ),
        );
      },
    );
  }
}
