import 'package:flutter/material.dart';
import 'package:carco/features/auth/presentation/view/widgets/create_account_view_body.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});
  static const String routeName = '/create_account';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CreateAccountViewBody()));
  }
}
