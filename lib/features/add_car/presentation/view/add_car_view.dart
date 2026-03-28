import 'package:carco/features/add_car/data/repositories/add_car_repository.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:carco/features/add_car/presentation/view/widgets/add_car_view_body.dart';

class AddCarView extends StatelessWidget {
  const AddCarView({super.key});
  static const String routeName = '/add_car';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarCubit(sl<AddCarRepository>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).addYourCar,
            style: AppTextStyles.textStyle20,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const SafeArea(child: AddCarViewBody()),
      ),
    );
  }
}
