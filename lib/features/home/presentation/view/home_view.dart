import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/features/home/presentation/cubit/home_cubit.dart';
import 'package:carco/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(sl())..fetchHomeData(),
      child: const Scaffold(
        backgroundColor: Color(0xFFF8F9FA),
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
