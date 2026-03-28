import 'package:carco/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:carco/features/auth/presentation/cubit/auth_state.dart';
import 'package:carco/features/main/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/core/widgets/custom_button.dart';
import 'package:carco/features/auth/presentation/view/create_account_view.dart';
import 'package:carco/features/auth/presentation/view/widgets/auth_bottom_row.dart';
import 'package:carco/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:carco/features/auth/presentation/view/widgets/google_button.dart';
import 'package:carco/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:carco/features/auth/presentation/view/widgets/or_divider.dart';
import 'package:carco/features/auth/presentation/view/widgets/language_toggle_button.dart';
import 'package:carco/generated/l10n.dart';
import 'package:carco/core/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is AuthError) {
          setState(() {
            isLoading = false;
          });
          context.showSnack(state.message);
        }
        if (state is Authenticated) {
          setState(() {
            isLoading = false;
          });
          context.showSnack('تم تسجيل الدخول بنجاح');
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (route) => false,
          );
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: 24.horizontal,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  16.h,
                  const Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: LanguageToggleButton(),
                  ),
                  16.h,
                  AuthHeader(
                    title: S.of(context).welcomeToCarCo,
                    subtitle: S.of(context).loginToContinue,
                  ),
                  32.h,
                  LabeledTextField(
                    label: S.of(context).email,
                    hintText: S.of(context).emailExample,
                    controller: emailController,
                    validator: (value) => MyValidators.emailValidator(value),
                    prefixIcon: Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  16.h,
                  LabeledTextField(
                    label: S.of(context).password,
                    hintText: S.of(context).passwordExample,
                    validator: (value) => MyValidators.passwordValidator(value),
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset(
                          isPasswordVisible
                              ? 'assets/svg/eye-off.svg'
                              : 'assets/svg/eye.svg',
                          height: 20,
                        ),
                      ),
                    ),
                    obscureText: !isPasswordVisible,
                  ),

                  16.h,
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        S.of(context).forgotPasswordQuestion,
                        style: AppTextStyles.textStyle14Bold.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  32.h,
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                    text: S.of(context).login,
                  ),
                  24.h,
                  const OrDivider(),
                  24.h,
                  GoogleButton(onTap: () {}),
                  32.h,
                  AuthBottomRow(
                    question: S.of(context).dontHaveAccount,
                    action: S.of(context).createAccount,
                    onTap: () {
                      Navigator.pushNamed(context, CreateAccountView.routeName);
                    },
                  ),
                  32.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
