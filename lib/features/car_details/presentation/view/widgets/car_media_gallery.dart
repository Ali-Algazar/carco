import 'package:flutter/material.dart';

class CarMediaGallery extends StatefulWidget {
  final List<String> images;
  final String? video;

  const CarMediaGallery({super.key, required this.images, this.video});

  @override
  State<CarMediaGallery> createState() => _CarMediaGalleryState();
}

class _CarMediaGalleryState extends State<CarMediaGallery> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // تجهيز قائمة العرض: لو في فيديو هنحطه أول عنصر، وبعدين الصور
    final int totalItems =
        (widget.video != null ? 1 : 0) + widget.images.length;

    return Stack(
      children: [
        PageView.builder(
          itemCount: totalItems,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            // حساب الإندكس الصحيح للصورة (بنطرح 1 لو فيه فيديو عشان نجيب أول صورة)
            final imageIndex = widget.video != null ? index - 1 : index;
            return Image.network(
              widget.images[imageIndex],
              fit: BoxFit.cover,
              width: double.infinity,
            );
          },
        ),

        // مؤشر الصفحات (Dots Indicator)
        Positioned(
          bottom: 32, // مرفوع شوية عشان الحواف الدائرية للقسم اللي تحته
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalItems,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? const Color(0xFFD4AF37)
                      : Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
