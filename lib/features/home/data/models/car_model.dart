class CarModel {
  final String id;
  final String name;
  final String location;
  final String year;
  final num price;
  final String type; // Sale or Rent
  final String carCategory; // Sedan, Coupe, etc (from admin 'type')
  final String image;
  final bool isAdmin; // 👈 أهم متغير عشان نفرق بيهم بعدين

  // بيانات إضافية عشان شاشة تفاصيل المعرض
  final String description;
  final List<String> features;
  final String fuelType;
  final String transmission;
  final String color;

  CarModel({
    required this.id,
    required this.name,
    required this.location,
    required this.year,
    required this.price,
    required this.type,
    required this.carCategory,
    required this.image,
    required this.isAdmin,
    this.description = '',
    this.features = const [],
    this.fuelType = '',
    this.transmission = '',
    this.color = '',
  });

  factory CarModel.fromJson(Map<String, dynamic> json, {bool isAdmin = false}) {
    // تحديد النوع (للبيع ولا للإيجار) بناءً على إنها من المعرض ولا المستخدم
    String offerType = isAdmin
        ? (json['operationType'] ?? 'Sale')
        : (json['type'] ?? 'Sale');

    // جلب الصورة الأولى لو متاحة
    String firstImage =
        (json['images'] != null && (json['images'] as List).isNotEmpty)
        ? json['images'][0]
        : 'https://placehold.co/424x320/1A1A1A/D4AF37?text=No+Image';

    return CarModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      // لو من المعرض نخلي مكانها "المعرض"، لو مستخدم نجيب مدينته
      location: isAdmin
          ? 'معرض CarCo'
          : (json['ownerAddress'] != null
                ? json['ownerAddress']['city'] ?? 'غير محدد'
                : 'غير محدد'),
      year: json['year']?.toString() ?? '',
      price: json['price'] ?? 0,
      type: offerType,
      carCategory: isAdmin ? (json['type'] ?? 'غير محدد') : 'غير محدد',
      image: firstImage,
      isAdmin: isAdmin, // 👈 بنحددها من الـ Data Source
      description: json['description'] ?? '',
      features: json['features'] != null
          ? List<String>.from(json['features'])
          : [],
      fuelType: json['fuelType'] ?? '',
      transmission: json['transmission'] ?? '',
      color: json['color'] ?? '',
    );
  }
}
