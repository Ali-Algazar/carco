import 'package:carco/core/cubit/cubit/nav_cubit.dart';
import 'package:carco/features/add_car/presentation/view/add_car_view.dart';
import 'package:carco/features/favorites/presentation/view/favorites_view.dart';
import 'package:carco/features/home/presentation/view/home_view.dart';
import 'package:carco/features/profile/presentation/view/profile_view.dart';
import 'package:carco/features/requests/presentation/view/my_cars_view.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    FavoritesView(),
    const Center(child: Text('Add Car Page')),
    MyCarsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavCubit, int>(
      listener: (context, state) {
        if (state == 2) {
          Navigator.pushNamed(context, AddCarView.routeName);
        } else {
          setState(() {
            _selectedIndex = state;
          });
        }
      },
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76.43,
      padding: const EdgeInsets.only(top: 9.48, left: 16, right: 16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.1),
            width: 1.49,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, -4),
            spreadRadius: -4,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, -10),
            spreadRadius: -3,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                context,
                index: 0,
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: S.of(context).home,
              ),
              _buildNavItem(
                context,
                index: 1,
                icon: Icons.favorite_outline,
                activeIcon: Icons.favorite,
                label: S.of(context).favorites,
              ),
              const SizedBox(width: 60),
              _buildNavItem(
                context,
                index: 3,
                icon: Icons.receipt_long_outlined,
                activeIcon: Icons.receipt_long,
                label: S.of(context).myOrders,
              ),
              _buildNavItem(
                context,
                index: 4,
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: S.of(context).myAccount,
              ),
            ],
          ),
          Positioned(top: -30, child: _buildCenterAddButton(context)),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected
        ? context.theme.colorScheme.primary
        : context.theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return InkWell(
      onTap: () => context.read<NavCubit>().changeNavIndex(index),

      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isSelected ? activeIcon : icon, color: color, size: 24),
            4.h,
            Text(
              label,
              style: AppTextStyles.caption.copyWith(color: color, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterAddButton(BuildContext context) {
    return InkWell(
      onTap: () => context.read<NavCubit>().changeNavIndex(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.primary.withValues(
                    alpha: 0.3,
                  ),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
          4.h,
          Text(
            S.of(context).addCar,
            style: AppTextStyles.caption.copyWith(
              color: context.theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
