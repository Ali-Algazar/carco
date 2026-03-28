import 'package:carco/features/add_car/presentation/view/add_car_view.dart';
import 'package:carco/features/auth/presentation/view/create_account_view.dart';
import 'package:carco/features/auth/presentation/view/login_view_body.dart';
import 'package:carco/features/main/presentation/view/main_view.dart';
import 'package:carco/features/notifications/presentation/view/notifications_view.dart';
import 'package:carco/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:carco/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case CreateAccountView.routeName:
      return MaterialPageRoute(builder: (_) => const CreateAccountView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case AddCarView.routeName:
      return MaterialPageRoute(builder: (_) => const AddCarView());
    case NotificationsView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationsView());
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No route defined'))),
      );
  }
}
