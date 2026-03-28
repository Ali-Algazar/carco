import 'dart:io';
import 'package:carco/core/constants.dart';
import 'package:carco/core/helper/hive_helper.dart';
import 'package:carco/features/auth/data/models/user_model.dart';
import 'package:carco/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:carco/core/extensions/extensions.dart';
import 'package:carco/core/utils/app_text_styles.dart';
import 'package:carco/core/widgets/custom_button.dart';
import 'package:carco/core/widgets/custom_text_form_field.dart';
import 'package:carco/features/add_car/data/models/add_car_params.dart';
import 'package:carco/features/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:carco/features/add_car/presentation/cubit/add_car_state.dart';
import 'offer_type_selector.dart';
import 'required_label.dart';
import 'upload_image_section.dart';

class AddCarViewBody extends StatefulWidget {
  const AddCarViewBody({super.key});

  @override
  State<AddCarViewBody> createState() => _AddCarViewBodyState();
}

class _AddCarViewBodyState extends State<AddCarViewBody> {
  final _formKey = GlobalKey<FormState>();
  String selectedOfferType = 'Sale';
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final mileageController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  List<File> selectedImages = [];
  final ImagePicker _picker = ImagePicker();
  File? selectedVideo;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCarCubit, AddCarState>(
      listener: (context, state) {
        if (state is AddCarSuccess) {
          context.showSnack('تم إضافة السيارة بنجاح');
          Navigator.pop(context);
        } else if (state is AddCarError) {
          context.showSnack(state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddCarLoading,
          child: SingleChildScrollView(
            padding: 16.all,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequiredLabel(text: S.of(context).offerType),
                  8.h,
                  OfferTypeSelector(
                    onChanged: (value) => selectedOfferType = value,
                  ),
                  24.h,
                  Text(
                    S.of(context).carDetails,
                    style: AppTextStyles.textStyle18,
                  ),
                  16.h,
                  RequiredLabel(text: S.of(context).carBrand),
                  8.h,
                  CustomTextFormField(
                    controller: brandController,
                    hintText: S.of(context).carBrandExample,
                  ),
                  16.h,
                  RequiredLabel(text: S.of(context).carModel),
                  8.h,
                  CustomTextFormField(
                    controller: modelController,
                    hintText: S.of(context).carModelExample,
                  ),
                  16.h,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredLabel(text: S.of(context).manufactureYear),
                            8.h,
                            CustomTextFormField(
                              controller: yearController,
                              hintText: S.of(context).yearExample,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      16.w,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredLabel(text: S.of(context).mileage),
                            8.h,
                            CustomTextFormField(
                              controller: mileageController,
                              hintText: S.of(context).mileageExample,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  16.h,
                  RequiredLabel(text: S.of(context).location),
                  8.h,
                  CustomTextFormField(
                    controller: locationController,
                    hintText: S.of(context).locationExample,
                  ),
                  16.h,
                  RequiredLabel(text: S.of(context).price),
                  8.h,
                  CustomTextFormField(
                    controller: priceController,
                    hintText: S.of(context).priceExample,
                    keyboardType: TextInputType.number,
                  ),
                  16.h,
                  RequiredLabel(text: S.of(context).description),
                  8.h,
                  CustomTextFormField(
                    controller: descriptionController,
                    hintText: S.of(context).descriptionHint,
                  ),
                  24.h,
                  RequiredLabel(text: S.of(context).carPhotos),
                  8.h,
                  UploadImageSection(
                    images: selectedImages,
                    onPickImages: _pickImages,
                    onRemoveImage: _removeImage,
                  ),
                  16.h,
                  RequiredLabel(text: 'فيديو السيارة (اختياري)'),
                  8.h,
                  GestureDetector(
                    onTap: _pickVideo,
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: selectedVideo == null
                          ? const Center(child: Text('اضغط لرفع فيديو'))
                          : Stack(
                              children: [
                                const Center(
                                  child: Icon(Icons.videocam, size: 40),
                                ),
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedVideo = null;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 12,
                                      child: Icon(Icons.close, size: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  24.h,
                  Container(
                    padding: 16.all,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.primary.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: context.theme.colorScheme.primary,
                        ),
                        12.w,
                        Expanded(
                          child: Text(
                            S.of(context).qualityReviewMsg,
                            style: AppTextStyles.textStyle14r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  32.h,
                  CustomButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (selectedImages.isEmpty) {
                          context.showSnack(
                            'يرجى رفع صورة واحدة على الأقل للسيارة',
                          );
                          return;
                        }
                        final ownerName =
                            await _getOwnerName(); // 💡 مستقبلا هنجيبها من بيانات اليوزر المسجل

                        context.read<AddCarCubit>().addCar(
                          AddCarParams(
                            ownerName: ownerName,
                            offerType: selectedOfferType,
                            brand: brandController.text,
                            model: modelController.text,
                            year: yearController.text,
                            mileage: mileageController.text,
                            location: locationController.text,

                            price: priceController.text,
                            description: descriptionController.text,
                            images: selectedImages.map((e) => e.path).toList(),
                            videoPath: selectedVideo?.path,
                          ),
                        );
                      }
                    },
                    text: S.of(context).publishAd,
                  ),
                  32.h,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String> _getOwnerName() async {
    var user =
        await HiveHelper.getData(
              boxName: Constants.userBox,
              key: Constants.userHiveKey,
            )
            as UserModel; // قيمة افتراضية مؤقتاً
    return user.fullName;
  }

  Future<void> _pickImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        for (var file in pickedFiles) {
          if (selectedImages.length < 6) {
            selectedImages.add(File(file.path));
          }
        }
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  Future<void> _pickVideo() async {
    final XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedVideo = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    brandController.dispose();
    modelController.dispose();
    yearController.dispose();
    mileageController.dispose();
    locationController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
