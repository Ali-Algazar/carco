class CarDetailsModel {
  final String id;
  final String name;
  final String location;
  final String year;
  final num price;
  final String type;
  final String image;
  final String description;
  final String transmission;
  final String mileage;
  final SellerModel seller;
  final List<String> images;
  final String? video;

  CarDetailsModel({
    required this.id,
    required this.name,
    required this.location,
    required this.year,
    required this.price,
    required this.type,
    required this.image,
    required this.description,
    required this.transmission,
    required this.mileage,
    required this.seller,
    required this.images,
    this.video,
  });

  factory CarDetailsModel.fromJson(Map<String, dynamic> json) {
    final imagesList = List<String>.from(json['images'] ?? []);

    String city = 'غير محدد';
    if (json['ownerAddress'] != null && json['ownerAddress']['city'] != null) {
      city = json['ownerAddress']['city'];
    }

    return CarDetailsModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      location: city,
      year: json['year']?.toString() ?? '',
      price: json['price'] ?? 0,
      type: json['type'] ?? 'Sale',
      image: imagesList.isNotEmpty
          ? imagesList[0]
          : 'https://placehold.co/424x320',
      description: json['description'] ?? 'لا يوجد وصف',
      transmission: json['transmission'] ?? 'أوتوماتيك',
      mileage: json['mileage']?.toString() ?? '0',
      seller: SellerModel.fromJson(json),
      images: imagesList,
      video: json['videoUrl'] ?? json['video'],
    );
  }
}

class SellerModel {
  final String name;
  final String joinedDate;
  final String phone;

  SellerModel({
    required this.name,
    required this.joinedDate,
    required this.phone,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    String year = '2024';
    if (json['createdAt'] != null) {
      DateTime date = DateTime.parse(json['createdAt']);
      year = date.year.toString();
    }

    return SellerModel(
      name: json['ownerName'] ?? 'غير محدد',
      joinedDate: year,
      phone: json['ownerPhone'] ?? 'غير محدد',
    );
  }
}
