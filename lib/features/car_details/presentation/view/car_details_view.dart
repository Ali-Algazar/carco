import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/features/car_details/presentation/cubit/car_details_cubit.dart';
import 'package:carco/features/car_details/presentation/cubit/car_details_state.dart';
import 'widgets/car_details_info_section.dart';
import 'widgets/car_details_bottom_bar.dart';

class CarDetailsView extends StatefulWidget {
  const CarDetailsView({super.key, required this.carId});

  final String carId;
  static const String routeName = '/car_details';

  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarDetailsCubit(sl())..fetchCarDetails(widget.carId),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: BlocBuilder<CarDetailsCubit, CarDetailsState>(
          builder: (context, state) {
            if (state is CarDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
              );
            } else if (state is CarDetailsLoaded) {
              final car = state.car;
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 320,
                        pinned: true,
                        // 👇 زرار الرجوع متفعل
                        leading: IconButton(
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        actions: [
                          StatefulBuilder(
                            builder: (context, setState) {
                              return IconButton(
                                icon: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFav
                                        ? const Color(0xFFE7000B)
                                        : Colors.black,
                                    size: 18,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isFav
                                            ? 'تم الإضافة للمفضلة'
                                            : 'تم الإزالة من المفضلة',
                                      ),
                                      backgroundColor: const Color(0xFFD4AF37),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.network(
                            car.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Transform.translate(
                          offset: const Offset(0, -20),
                          child: CarDetailsInfoSection(car: car),
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 100)),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CarDetailsBottomBar(
                      price: car.price,
                      type: car.type,
                    ),
                  ),
                ],
              );
            } else if (state is CarDetailsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
