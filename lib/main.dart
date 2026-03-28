import 'package:carco/app_restart.dart';
import 'package:carco/core/cubit/cubit/locale_cubit.dart';
import 'package:carco/core/cubit/cubit/nav_cubit.dart';
import 'package:carco/core/helper/hive_helper.dart';
import 'package:carco/core/helper_functions/on_generate_routes.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/core/theme/app_theme.dart';
import 'package:carco/features/auth/data/repositories/auth_repository.dart';
import 'package:carco/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  HiveHelper.registerAdapter();
  setupServiceLocator();

  runApp(RestartWidget(child: const CarCo()));
}

class CarCo extends StatelessWidget {
  const CarCo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(
          create: (context) => AuthCubit(sl<AuthRepository>())..checkAuth(),
        ),
        BlocProvider(create: (context) => NavCubit()),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CarCo',
            locale: Locale(state),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: onGenerateRoute,
            theme: AppTheme.lightTheme(
              state == 'ar' ? 'Tajawal' : 'Nunito Sans',
            ),
            // darkTheme: AppTheme.darkTheme(
            //   state == 'ar' ? 'Tajawal' : 'Nunito Sans',
            // ),
            themeMode: ThemeMode.system,
          );
        },
      ),
    );
  }
}
