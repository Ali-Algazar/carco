import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:carco/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:carco/features/home/presentation/view/widgets/car_item_card.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
          );
        } else if (state is FavoritesLoaded) {
          if (state.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.withValues(alpha: 0.3),
                  ),
                  16.h,
                  Text(
                    'لا توجد سيارات في المفضلة حالياً',
                    style: AppTextStyles.textStyle16Medium.copyWith(
                      color: const Color(0xFF717182),
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            itemCount: state.favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final car = state.favorites[index];
              return Stack(
                children: [
                  CarItemCard(car: car),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: InkWell(
                      onTap: () {
                        context.read<FavoritesCubit>().removeFavorite(2);
                        context.showSnack('تم إزالة السيارة من المفضلة');
                      },
                      child: Container(
                        padding: 4.all,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite,
                          size: 20,
                          color: Color(0xFFE7000B),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is FavoritesError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
