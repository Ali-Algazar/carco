import 'package:carco/features/home/data/models/car_model.dart';
import 'package:carco/features/notifications/presentation/view/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/core/widgets/custom_search_bar.dart';
import 'package:carco/features/home/presentation/cubit/home_cubit.dart';
import 'package:carco/features/home/presentation/cubit/home_state.dart';
import 'categories_section.dart';
import 'home_banner.dart';
import 'car_item_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final List<String> _categories = ["الكل", "للبيع", "للإيجار"];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          List<CarModel> allCars = state.homeData.featuredCars;
          List<CarModel> displayedCars = [];

          if (_selectedCategoryIndex == 0) {
            displayedCars = allCars;
          } else if (_selectedCategoryIndex == 1) {
            displayedCars = allCars.where((car) => car.type == 'Sale').toList();
          } else if (_selectedCategoryIndex == 2) {
            displayedCars = allCars.where((car) => car.type == 'Rent').toList();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/CarCo-h.png', height: 30),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NotificationsView.routeName,
                        );
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(Icons.notifications_none, size: 28),
                          Positioned(
                            right: -2,
                            top: -2,
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                16.h,
                CustomSearchBar(
                  hintText: 'ابحث عن سيارتك المثالية...',
                  onChanged: (value) {},
                ),
                24.h,
                const HomeBanner(),
                24.h,
                CategoriesSection(
                  categories: _categories,
                  selectedIndex: _selectedCategoryIndex,
                  onCategoryChanged: (index) {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                ),

                32.h,
                Text(
                  'سيارات مميزة',
                  style: AppTextStyles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.h,
                displayedCars.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text('لا توجد سيارات في هذا القسم حالياً'),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: displayedCars.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.75,
                            ),
                        itemBuilder: (context, index) {
                          return CarItemCard(car: displayedCars[index]);
                        },
                      ),
                24.h,
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
