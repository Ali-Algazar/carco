import 'package:carco/core/utils/validators.dart';
import 'package:carco/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:carco/features/auth/presentation/cubit/auth_state.dart';
import 'package:carco/features/main/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/widgets/custom_button.dart';
import 'package:carco/features/auth/presentation/view/widgets/auth_bottom_row.dart';
import 'package:carco/features/auth/presentation/view/widgets/auth_header.dart';
import 'package:carco/features/auth/presentation/view/widgets/google_button.dart';
import 'package:carco/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:carco/features/auth/presentation/view/widgets/or_divider.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
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
          context.showSnack('تم إنشاء الحساب بنجاح');
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (route) => false,
          );
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: false,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: 24.horizontal,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  32.h,
                  AuthHeader(
                    title: S.of(context).welcomeToCarCo,
                    subtitle: S.of(context).createNewAccount,
                  ),
                  32.h,
                  LabeledTextField(
                    label: S.of(context).fullName,
                    hintText: S.of(context).enterFullName,
                    validator: (value) {
                      return MyValidators.displayNamevalidator(value);
                    },
                    prefixIcon: Icon(Icons.person),
                    controller: nameController,
                    keyboardType: TextInputType.name,
                  ),
                  16.h,
                  LabeledTextField(
                    label: S.of(context).email,
                    hintText: S.of(context).emailExample,
                    controller: emailController,
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    prefixIcon: Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  16.h,
                  LabeledTextField(
                    label: S.of(context).password,
                    hintText: S.of(context).passwordExample,
                    controller: passwordController,
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
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
                  32.h,
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                          fullName: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    text: S.of(context).createAccount,
                  ),
                  24.h,
                  const OrDivider(),
                  24.h,
                  GoogleButton(onTap: () {}),
                  32.h,
                  AuthBottomRow(
                    question: S.of(context).alreadyHaveAccount,
                    action: S.of(context).login,
                    onTap: () {
                      Navigator.pop(context);
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
