import 'package:carco/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/car_model.dart';
import '../../data/models/order_params.dart';
import '../cubit/order_cubit.dart';

class CheckoutView extends StatefulWidget {
  final CarModel car;
  final String orderType;

  const CheckoutView({super.key, required this.car, required this.orderType});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        sl(),
      ), // ACTION REQUIRED: تأكد إن الـ apiHelper مسجل في GetIt
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'إتمام الطلب',
            style: AppTextStyles.textStyle18.copyWith(
              color: const Color(0xFF37246A),
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF37246A),
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderSuccess) {
              Navigator.pop(context); // يقفل شاشة الدفع
              Navigator.pop(context); // يقفل شاشة التفاصيل (يرجع للرئيسية)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم إرسال طلبك بنجاح! سنتواصل معك قريباً.'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is OrderError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderSummary(),
                    const SizedBox(height: 32),
                    Text(
                      'بيانات التواصل',
                      style: AppTextStyles.textStyle18.copyWith(
                        color: const Color(0xFF37246A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _nameController,
                      label: 'الاسم بالكامل',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _emailController,
                      label: 'البريد الإلكتروني',
                      icon: Icons.email_outlined,
                      isEmail: true,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _phoneController,
                      label: 'رقم الموبايل',
                      icon: Icons.phone_outlined,
                      isPhone: true,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _addressController,
                      label: 'عنوان استلام السيارة',
                      icon: Icons.location_on_outlined,
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: Color(0xFF155DFC),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'طريقة الدفع المتاحة حالياً هي (الدفع نقداً عند الاستلام).',
                              style: AppTextStyles.caption.copyWith(
                                color: const Color(0xFF155DFC),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: state is OrderLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<OrderCubit>().createOrder(
                                    OrderParams(
                                      productId: widget.car.id,
                                      orderType: widget.orderType,
                                      price: widget.car.price,
                                      fullName: _nameController.text,
                                      email: _emailController.text,
                                      phone: _phoneController.text,
                                      address: _addressController.text,
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF37246A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: state is OrderLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'تأكيد وإرسال الطلب',
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
          },
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.car.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.car.name,
                  style: AppTextStyles.textStyle16Medium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF37246A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.orderType == 'Sale' ? 'طلب شراء' : 'طلب تأجير',
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF6A7282),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.car.price} جنيه',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    color: const Color(0xFF155DFC),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPhone = false,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isPhone
          ? TextInputType.phone
          : (isEmail ? TextInputType.emailAddress : TextInputType.text),
      validator: (value) =>
          value == null || value.isEmpty ? 'هذا الحقل مطلوب' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF99A1AF)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF37246A)),
        ),
      ),
    );
  }
}
