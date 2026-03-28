import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/features/car_details/data/repositories/car_details_repository.dart';
import 'package:carco/features/car_details/presentation/view/car_details_view.dart';
import 'package:carco/features/edit_car/presentation/view/edit_car_view.dart';
import 'package:carco/features/requests/data/models/my_car_model.dart';
import 'package:carco/features/requests/presentation/cubit/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';

class MyCarItemCard extends StatelessWidget {
  const MyCarItemCard({super.key, required this.car});

  final MyCarModel car;

  @override
  Widget build(BuildContext context) {
    final isRent = car.type == 'Rent';

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsView(carId: car.id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE0E1DD)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                car.image,
                width: 96,
                height: 96,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 96,
                  height: 96,
                  color: const Color(0xFFF8F9FA),
                  child: const Icon(Icons.directions_car, color: Colors.grey),
                ),
              ),
            ),
            12.w,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          car.name,
                          style: AppTextStyles.textStyle16Medium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Color(0xFF717182),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onSelected: (value) {
                          if (value == 'edit') {
                            _onEditTapped(context, car.id);
                          } else if (value == 'delete') {
                            _showDeleteConfirmationDialog(context, car.id);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                8.w,
                                const Text('تعديل'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                8.w,
                                const Text(
                                  'حذف',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  4.h,
                  Text(
                    'تاريخ الإضافة: ${car.date}',
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF717182),
                    ),
                  ),
                  12.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${car.price}',
                            style: AppTextStyles.textStyle16Medium.copyWith(
                              color: context.theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          4.w,
                          Text(
                            isRent ? 'جنيه/يوم' : 'جنيه',
                            style: AppTextStyles.caption.copyWith(
                              color: const Color(0xFF717182),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          isRent ? 'للإيجار' : 'للبيع',
                          style: AppTextStyles.caption.copyWith(
                            color: context.theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onEditTapped(BuildContext context, String carId) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
      ),
    );

    final carDetails = await sl<CarDetailsRepository>().getCarDetails(carId);

    if (context.mounted) {
      Navigator.pop(context);
    }
    carDetails.fold(
      (failure) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      (fullCar) async {
        if (context.mounted) {
          final bool? shouldRefresh = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => EditCarView(oldCar: fullCar)),
          );
          if (shouldRefresh == true && context.mounted) {
            context.read<MyCarsCubit>().fetchMyCars();
          }
        }
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String carId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('تأكيد الحذف'),
        content: const Text(
          'هل أنت متأكد أنك تريد حذف هذه السيارة بشكل نهائي؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<MyCarsCubit>().deleteCar(carId);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم حذف السيارة بنجاح'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Text('حذف', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
