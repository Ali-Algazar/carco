class OrderParams {
  final String productId;
  final String productModel; // دايماً "Car"
  final String orderType; // Sale أو Rent
  final num price;
  final String fullName;
  final String email;
  final String phone;
  final String address;

  OrderParams({
    required this.productId,
    this.productModel = 'Car',
    required this.orderType,
    required this.price,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productModel": productModel,
    "orderType": orderType,
    "price": price,
    "payment": {"method": "cash"},
    "customerDetails": {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "address": address,
    },
  };
}
