import 'dart:io';
import 'package:carco/core/services/get_it_service.dart';
import 'package:carco/features/car_details/data/models/car_details_model.dart';
import 'package:carco/features/edit_car/data/repositories/edit_car_repository.dart';
import 'package:carco/features/edit_car/presentation/cubit/edit_car_cubit.dart';
import 'package:carco/features/edit_car/presentation/cubit/edit_car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/widgets/custom_button.dart';
import 'package:carco/core/widgets/custom_text_form_field.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';
import 'package:carco/features/add_car/presentation/view/widgets/offer_type_selector.dart';

class EditCarView extends StatefulWidget {
  final CarDetailsModel oldCar;

  const EditCarView({super.key, required this.oldCar});

  @override
  State<EditCarView> createState() => _EditCarViewState();
}

class _EditCarViewState extends State<EditCarView> {
  final _formKey = GlobalKey<FormState>();
  late String selectedOfferType;
  late TextEditingController brandController;
  late TextEditingController modelController;
  late TextEditingController yearController;
  late TextEditingController mileageController;
  late TextEditingController locationController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  List<dynamic> mixedImages = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    List<String> nameParts = widget.oldCar.name.split(' ');
    String brand = nameParts.isNotEmpty ? nameParts[0] : '';
    String model = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    selectedOfferType = widget.oldCar.type;
    brandController = TextEditingController(text: brand);
    modelController = TextEditingController(text: model);
    yearController = TextEditingController(text: widget.oldCar.year);
    mileageController = TextEditingController(text: widget.oldCar.mileage);
    locationController = TextEditingController(text: widget.oldCar.location);
    priceController = TextEditingController(
      text: widget.oldCar.price.toString(),
    );
    descriptionController = TextEditingController(
      text: widget.oldCar.description,
    );

    mixedImages.addAll(widget.oldCar.images);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCarCubit(sl<EditCarRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تعديل السيارة',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocConsumer<EditCarCubit, EditCarState>(
          listener: (context, state) {
            if (state is EditCarSuccess) {
              context.showSnack('تم تعديل السيارة بنجاح');
              Navigator.pop(context, true);
            } else if (state is EditCarError) {
              context.showSnack(state.message);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is EditCarLoading,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OfferTypeSelector(
                        onChanged: (value) => selectedOfferType = value,
                      ),
                      16.h,
                      CustomTextFormField(
                        controller: brandController,
                        hintText: 'الماركة (مثل: BMW)',
                      ),
                      16.h,
                      CustomTextFormField(
                        controller: modelController,
                        hintText: 'الموديل (مثل: X6)',
                      ),
                      16.h,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: yearController,
                              hintText: 'سنة الصنع',
                            ),
                          ),
                          16.w,
                          Expanded(
                            child: CustomTextFormField(
                              controller: mileageController,
                              hintText: 'الكيلومترات',
                            ),
                          ),
                        ],
                      ),
                      16.h,
                      CustomTextFormField(
                        controller: priceController,
                        hintText: 'السعر',
                      ),
                      16.h,
                      CustomTextFormField(
                        controller: locationController,
                        hintText: 'الموقع',
                      ),
                      16.h,
                      CustomTextFormField(
                        controller: descriptionController,
                        hintText: 'الوصف',
                      ),
                      24.h,

                      const Text(
                        'الصور:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      12.h,
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(mixedImages.length, (index) {
                          final item = mixedImages[index];
                          return Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: item is String
                                        ? NetworkImage(item) as ImageProvider
                                        : FileImage(item),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: InkWell(
                                  onTap: () => setState(
                                    () => mixedImages.removeAt(index),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.close,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      12.h,
                      InkWell(
                        onTap: () async {
                          final List<XFile> pickedFiles = await _picker
                              .pickMultiImage();
                          setState(() {
                            mixedImages.addAll(
                              pickedFiles.map((e) => File(e.path)),
                            );
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add_photo_alternate),
                              Text(' إضافة صور'),
                            ],
                          ),
                        ),
                      ),
                      32.h,
                      CustomButton(
                        text: 'حفظ التعديلات',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            List<String> pathsToUpload = mixedImages
                                .map((e) => e is String ? e : (e as File).path)
                                .toList();

                            context.read<EditCarCubit>().updateCar(
                              widget.oldCar.id,
                              AddCarParams(
                                offerType: selectedOfferType,
                                brand: brandController.text,
                                model: modelController.text,
                                year: yearController.text,
                                mileage: mileageController.text,
                                location: locationController.text,
                                price: priceController.text,
                                description: descriptionController.text,
                                images: pathsToUpload,
                                fuelType: widget.oldCar.type,
                                ownerName: widget.oldCar.seller.name,
                                ownerPhone: widget.oldCar.seller.phone,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
