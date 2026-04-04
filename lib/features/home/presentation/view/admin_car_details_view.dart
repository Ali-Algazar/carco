import 'package:carco/features/home/presentation/view/checkout_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/car_model.dart';

class AdminCarDetailsView extends StatelessWidget {
  final CarModel car;
  const AdminCarDetailsView({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.8),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF37246A),
                    size: 20,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                car.image,
                fit: BoxFit.cover,
                // ACTION REQUIRED: أضف errorBuilder لو حابب
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          car.name,
                          style: AppTextStyles.textStyle18.copyWith(
                            color: const Color(0xFF37246A),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          car.year,
                          style: AppTextStyles.caption.copyWith(
                            color: const Color(0xFF155DFC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'المواصفات الأساسية',
                    style: AppTextStyles.textStyle18.copyWith(
                      color: const Color(0xFF37246A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSpecsRow(),
                  const SizedBox(height: 24),
                  if (car.features.isNotEmpty) ...[
                    Text(
                      'المميزات',
                      style: AppTextStyles.textStyle18.copyWith(
                        color: const Color(0xFF37246A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 12,
                      children: car.features
                          .map((feature) => _buildFeatureChip(feature))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                  Text(
                    'عن السيارة',
                    style: AppTextStyles.textStyle18.copyWith(
                      color: const Color(0xFF37246A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    car.description.isEmpty
                        ? 'لا يوجد وصف متاح لهذه السيارة حالياً.'
                        : car.description,
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF475569),
                      height: 1.6,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildSpecsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSpecItem(
          Icons.settings_suggest_outlined,
          'الناقل',
          car.transmission.isEmpty ? 'أوتوماتيك' : car.transmission,
        ),
        _buildSpecItem(
          Icons.local_gas_station_outlined,
          'الوقود',
          car.fuelType.isEmpty ? 'بنزين' : car.fuelType,
        ),
        _buildSpecItem(
          Icons.color_lens_outlined,
          'اللون',
          car.color.isEmpty ? 'غير محدد' : car.color,
        ),
        _buildSpecItem(
          Icons.category_outlined,
          'الفئة',
          car.carCategory.isEmpty ? 'سيدان' : car.carCategory,
        ),
      ],
    );
  }

  Widget _buildSpecItem(IconData icon, String title, String value) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Icon(icon, color: const Color(0xFF37246A), size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyles.caption.copyWith(
            color: const Color(0xFF6A7282),
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.caption.copyWith(
            color: const Color(0xFF101828),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: const Color(0xFF166534),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final bool isRent = car.type == 'Rent';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السعر الإجمالي',
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF6A7282),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${car.price}',
                      style: AppTextStyles.textStyle20.copyWith(
                        color: const Color(0xFF155DFC),
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      isRent ? ' جنيه/يوم' : ' جنيه',
                      style: AppTextStyles.caption.copyWith(
                        color: const Color(0xFF37246A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CheckoutView(car: car, orderType: car.type),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF37246A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  isRent ? 'طلب تأجير' : 'طلب شراء',
                  style: AppTextStyles.textStyle16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
