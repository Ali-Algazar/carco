class MyCarModel {
  final String id;
  final String name;
  final String image;
  final num price;
  final String type;
  final String date;

  MyCarModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.date,
  });

  factory MyCarModel.fromJson(Map<String, dynamic> json) {
    String formattedDate = '';
    if (json['createdAt'] != null) {
      DateTime parsedDate = DateTime.parse(json['createdAt']);
      formattedDate =
          '${parsedDate.year}/${parsedDate.month}/${parsedDate.day}';
    }

    return MyCarModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'بدون اسم',
      image: (json['images'] != null && json['images'].isNotEmpty)
          ? json['images'][0]
          : 'https://placehold.co/400x400/png',
      price: json['price'] ?? 0,
      type: json['type'] ?? 'Sale',
      date: formattedDate,
    );
  }
}
