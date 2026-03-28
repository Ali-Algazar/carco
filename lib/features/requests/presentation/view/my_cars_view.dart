import 'package:carco/core/cubit/cubit/nav_cubit.dart';
import 'package:carco/features/requests/presentation/cubit/requests_cubit.dart';
import 'package:carco/features/requests/presentation/cubit/requests_state.dart';
import 'package:carco/features/requests/presentation/view/widgets/request_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCarsCubit(sl())..fetchMyCars(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'سياراتي',
            style: AppTextStyles.textStyle20.copyWith(
              color: const Color(0xFF1A1A1A),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => context.read<NavCubit>().changeNavIndex(0),
          ),
        ),
        body: BlocBuilder<MyCarsCubit, MyCarsState>(
          builder: (context, state) {
            if (state is MyCarsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
              );
            } else if (state is MyCarsLoaded) {
              if (state.cars.isEmpty) {
                return const Center(
                  child: Text('لم تقم بإضافة أي سيارات بعد.'),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  return MyCarItemCard(car: state.cars[index]);
                },
              );
            } else if (state is MyCarsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
