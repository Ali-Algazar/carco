class CarModel {
  final String id;
  final String name;
  final String location;
  final String year;
  final num price;
  final String type;
  final String image;

  CarModel({
    required this.id,
    required this.name,
    required this.location,
    required this.year,
    required this.price,
    required this.type,
    required this.image,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      location: json['ownerAddress'] != null
          ? json['ownerAddress']['city'] ?? 'غير محدد'
          : 'غير محدد',
      year: json['year']?.toString() ?? '',
      price: json['price'] ?? 0,
      type: json['type'] ?? json['operationType'] ?? 'Sale',
      image: (json['images'] != null && (json['images'] as List).isNotEmpty)
          ? json['images'][0]
          : 'https://placehold.co/424x320/1A1A1A/D4AF37?text=No+Image',
    );
  }
}
