import 'package:carco/app_restart.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutConfirmButton extends StatelessWidget {
  const LogoutConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await BlocProvider.of<AuthCubit>(context).logout();
        RestartWidget.restartApp(context);
      },
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            S.of(context).yes,
            style: AppTextStyles.textStyle18.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
