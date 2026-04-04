import 'package:carco/features/car_details/presentation/view/car_details_view.dart';
import 'package:carco/features/home/presentation/view/admin_car_details_view.dart';
import 'package:flutter/material.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/features/home/data/models/car_model.dart';

class CarItemCard extends StatefulWidget {
  const CarItemCard({super.key, required this.car});

  final CarModel car;

  @override
  State<CarItemCard> createState() => _CarItemCardState();
}

class _CarItemCardState extends State<CarItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final isRent = widget.car.type == 'Rent';

    return InkWell(
      onTap: () {
        if (widget.car.isAdmin) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AdminCarDetailsView(car: widget.car),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CarDetailsView(carId: widget.car.id),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE0E1DD)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(widget.car.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        isRent ? 'للإيجار' : 'للبيع',
                        style: AppTextStyles.caption.copyWith(
                          color: const Color(0xFF1A1A1A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: 4.all,
                        decoration: BoxDecoration(
                          color: isFavorite
                              ? Colors.white
                              : const Color(0x141A1A1A),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: isFavorite
                              ? const Color(0xFFE7000B)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: 12.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.car.name,
                    style: AppTextStyles.textStyle14Medium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.h,
                  Text(
                    '${widget.car.location} • ${widget.car.year}',
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFF717182),
                    ),
                  ),
                  8.h,
                  Row(
                    children: [
                      Text(
                        '${widget.car.price}',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
