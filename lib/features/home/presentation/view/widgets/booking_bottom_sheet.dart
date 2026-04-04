import 'package:carco/features/home/data/models/car_model.dart';
import 'package:carco/features/home/data/models/order_params.dart';
import 'package:carco/features/home/presentation/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBottomSheet extends StatefulWidget {
  final CarModel car;
  final String orderType;
  const BookingBottomSheet({
    super.key,
    required this.car,
    required this.orderType,
  });

  @override
  State<BookingBottomSheet> createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إتمام طلب ${widget.orderType == 'Sale' ? 'الشراء' : 'التأجير'}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'الاسم بالكامل'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'رقم الموبايل'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'عنوان الاستلام'),
            ),
            const SizedBox(height: 20),
            BlocConsumer<OrderCubit, OrderState>(
              listener: (context, state) {
                if (state is OrderSuccess) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم إرسال طلبك بنجاح!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return state is OrderLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<OrderCubit>().createOrder(
                              OrderParams(
                                productId: widget.car.id,
                                orderType: widget.orderType,
                                price: widget.car.price,
                                fullName: _nameController.text,
                                email:
                                    "user@example.com", // ACTION: يفضل تجيبه من بيانات المستخدم المسجل
                                phone: _phoneController.text,
                                address: _addressController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('تأكيد الطلب'),
                      );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
