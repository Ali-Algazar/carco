class AddCarParams {
  final String offerType;
  final String brand;
  final String model;
  final String year;
  final String mileage;
  final String location;
  final String price;
  final String description;
  final List<String> images;
  final String? videoPath;

  final String fuelType;
  final String ownerName;
  final String ownerPhone;

  AddCarParams({
    required this.offerType,
    required this.brand,
    required this.model,
    required this.year,
    required this.mileage,
    required this.location,
    required this.price,
    required this.description,
    required this.images,
    this.videoPath,
    required this.ownerName,
    this.fuelType = 'بنزين',
    this.ownerPhone = '01000000000',
  });
}
