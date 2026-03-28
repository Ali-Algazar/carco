import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(sl())..fetchFavorites(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'المفضلة',
            style: AppTextStyles.textStyle20.copyWith(
              color: const Color(0xFF1A1A1A),
            ),
          ),
        ),
        body: const SafeArea(child: FavoritesViewBody()),
      ),
    );
  }
}
