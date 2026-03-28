// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `اكتشف سيارة أحلامك`
  String get onboarding1Title {
    return Intl.message(
      'اكتشف سيارة أحلامك',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `تصفح مجموعة كبيرة من السيارات الفاخرة والاقتصادية المعروضة للبيع أو الإيجار بأفضل الأسعار`
  String get onboarding1Desc {
    return Intl.message(
      'تصفح مجموعة كبيرة من السيارات الفاخرة والاقتصادية المعروضة للبيع أو الإيجار بأفضل الأسعار',
      name: 'onboarding1Desc',
      desc: '',
      args: [],
    );
  }

  /// `أسهل طرق الحجز`
  String get onboarding2Title {
    return Intl.message(
      'أسهل طرق الحجز',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `احجز سيارتك المفضلة بخطوات بسيطة وسريعة بدون تعقيدات واستلمها في الوقت المناسب لك`
  String get onboarding2Desc {
    return Intl.message(
      'احجز سيارتك المفضلة بخطوات بسيطة وسريعة بدون تعقيدات واستلمها في الوقت المناسب لك',
      name: 'onboarding2Desc',
      desc: '',
      args: [],
    );
  }

  /// `انطلق في رحلتك`
  String get onboarding3Title {
    return Intl.message(
      'انطلق في رحلتك',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `استلم سيارتك واستمتع بتجربة قيادة لا تُنسى مع خدماتنا المميزة ودعمنا المتواصل`
  String get onboarding3Desc {
    return Intl.message(
      'استلم سيارتك واستمتع بتجربة قيادة لا تُنسى مع خدماتنا المميزة ودعمنا المتواصل',
      name: 'onboarding3Desc',
      desc: '',
      args: [],
    );
  }

  /// `مرحباً بك في CarCo`
  String get welcomeToCarCo {
    return Intl.message(
      'مرحباً بك في CarCo',
      name: 'welcomeToCarCo',
      desc: '',
      args: [],
    );
  }

  /// `أنشئ حساب جديد`
  String get createNewAccount {
    return Intl.message(
      'أنشئ حساب جديد',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get fullName {
    return Intl.message('الاسم الكامل', name: 'fullName', desc: '', args: []);
  }

  /// `أدخل اسمك الكامل`
  String get enterFullName {
    return Intl.message(
      'أدخل اسمك الكامل',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message('البريد الإلكتروني', name: 'email', desc: '', args: []);
  }

  /// `example@email.com`
  String get emailExample {
    return Intl.message(
      'example@email.com',
      name: 'emailExample',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message('كلمة المرور', name: 'password', desc: '', args: []);
  }

  /// `••••••••`
  String get passwordExample {
    return Intl.message(
      '••••••••',
      name: 'passwordExample',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب`
  String get createAccount {
    return Intl.message(
      'إنشاء حساب',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `أو`
  String get or {
    return Intl.message('أو', name: 'or', desc: '', args: []);
  }

  /// `متابعة مع جوجل`
  String get continueWithGoogle {
    return Intl.message(
      'متابعة مع جوجل',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب؟`
  String get alreadyHaveAccount {
    return Intl.message(
      'لديك حساب؟',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message('تسجيل الدخول', name: 'login', desc: '', args: []);
  }

  /// `سجل دخولك للمتابعة`
  String get loginToContinue {
    return Intl.message(
      'سجل دخولك للمتابعة',
      name: 'loginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `هل نسيت كلمة المرور؟`
  String get forgotPasswordQuestion {
    return Intl.message(
      'هل نسيت كلمة المرور؟',
      name: 'forgotPasswordQuestion',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get dontHaveAccount {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `حسابي`
  String get myAccount {
    return Intl.message('حسابي', name: 'myAccount', desc: '', args: []);
  }

  /// `طلباتي`
  String get myOrders {
    return Intl.message('طلباتي', name: 'myOrders', desc: '', args: []);
  }

  /// `أضف سيارة`
  String get addCar {
    return Intl.message('أضف سيارة', name: 'addCar', desc: '', args: []);
  }

  /// `المفضلة`
  String get favorites {
    return Intl.message('المفضلة', name: 'favorites', desc: '', args: []);
  }

  /// `الرئيسية`
  String get home {
    return Intl.message('الرئيسية', name: 'home', desc: '', args: []);
  }

  /// `أضف سيارتك`
  String get addYourCar {
    return Intl.message('أضف سيارتك', name: 'addYourCar', desc: '', args: []);
  }

  /// `املأ البيانات بدقة`
  String get fillDetailsAccurately {
    return Intl.message(
      'املأ البيانات بدقة',
      name: 'fillDetailsAccurately',
      desc: '',
      args: [],
    );
  }

  /// `نوع العرض`
  String get offerType {
    return Intl.message('نوع العرض', name: 'offerType', desc: '', args: []);
  }

  /// `للإيجار`
  String get forRent {
    return Intl.message('للإيجار', name: 'forRent', desc: '', args: []);
  }

  /// `للبيع`
  String get forSale {
    return Intl.message('للبيع', name: 'forSale', desc: '', args: []);
  }

  /// `اختر نوع العرض المناسب لسيارتك`
  String get chooseOfferTypeDesc {
    return Intl.message(
      'اختر نوع العرض المناسب لسيارتك',
      name: 'chooseOfferTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `صور السيارة`
  String get carPhotos {
    return Intl.message('صور السيارة', name: 'carPhotos', desc: '', args: []);
  }

  /// `رفع صورة`
  String get uploadImage {
    return Intl.message('رفع صورة', name: 'uploadImage', desc: '', args: []);
  }

  /// `يمكنك رفع حتى 6 صور • الحد الأقصى 5 ميجا لكل صورة`
  String get uploadImageHint {
    return Intl.message(
      'يمكنك رفع حتى 6 صور • الحد الأقصى 5 ميجا لكل صورة',
      name: 'uploadImageHint',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل السيارة`
  String get carDetails {
    return Intl.message(
      'تفاصيل السيارة',
      name: 'carDetails',
      desc: '',
      args: [],
    );
  }

  /// `الماركة`
  String get carBrand {
    return Intl.message('الماركة', name: 'carBrand', desc: '', args: []);
  }

  /// `مثال: مرسيدس، بي إم دبليو، أودي`
  String get carBrandExample {
    return Intl.message(
      'مثال: مرسيدس، بي إم دبليو، أودي',
      name: 'carBrandExample',
      desc: '',
      args: [],
    );
  }

  /// `الموديل`
  String get carModel {
    return Intl.message('الموديل', name: 'carModel', desc: '', args: []);
  }

  /// `مثال: S-Class، X6، A8`
  String get carModelExample {
    return Intl.message(
      'مثال: S-Class، X6، A8',
      name: 'carModelExample',
      desc: '',
      args: [],
    );
  }

  /// `عداد الكيلومترات`
  String get mileage {
    return Intl.message(
      'عداد الكيلومترات',
      name: 'mileage',
      desc: '',
      args: [],
    );
  }

  /// `10,000`
  String get mileageExample {
    return Intl.message('10,000', name: 'mileageExample', desc: '', args: []);
  }

  /// `سنة الصنع`
  String get manufactureYear {
    return Intl.message(
      'سنة الصنع',
      name: 'manufactureYear',
      desc: '',
      args: [],
    );
  }

  /// `2024`
  String get yearExample {
    return Intl.message('2024', name: 'yearExample', desc: '', args: []);
  }

  /// `السعر`
  String get price {
    return Intl.message('السعر', name: 'price', desc: '', args: []);
  }

  /// `2,500,000 ج.م`
  String get priceExample {
    return Intl.message(
      '2,500,000 ج.م',
      name: 'priceExample',
      desc: '',
      args: [],
    );
  }

  /// `أدخل سعر البيع`
  String get enterSellingPrice {
    return Intl.message(
      'أدخل سعر البيع',
      name: 'enterSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `الموقع`
  String get location {
    return Intl.message('الموقع', name: 'location', desc: '', args: []);
  }

  /// `القاهرة، الجيزة، الإسكندرية...`
  String get locationExample {
    return Intl.message(
      'القاهرة، الجيزة، الإسكندرية...',
      name: 'locationExample',
      desc: '',
      args: [],
    );
  }

  /// `الوصف`
  String get description {
    return Intl.message('الوصف', name: 'description', desc: '', args: []);
  }

  /// `اكتب وصف تفصيلي للسيارة، المواصفات، الحالة...`
  String get descriptionHint {
    return Intl.message(
      'اكتب وصف تفصيلي للسيارة، المواصفات، الحالة...',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `كلما كان الوصف دقيقاً، زادت فرص البيع`
  String get descriptionTip {
    return Intl.message(
      'كلما كان الوصف دقيقاً، زادت فرص البيع',
      name: 'descriptionTip',
      desc: '',
      args: [],
    );
  }

  /// `مراجعة الجودة`
  String get qualityReview {
    return Intl.message(
      'مراجعة الجودة',
      name: 'qualityReview',
      desc: '',
      args: [],
    );
  }

  /// `سيتم مراجعة إعلانك من قبل فريقنا للتأكد من الجودة. ستتلقى إشعاراً عند الموافقة عليه. نلتزم بتوفير أفضل تجربة لعملائنا!`
  String get qualityReviewMsg {
    return Intl.message(
      'سيتم مراجعة إعلانك من قبل فريقنا للتأكد من الجودة. ستتلقى إشعاراً عند الموافقة عليه. نلتزم بتوفير أفضل تجربة لعملائنا!',
      name: 'qualityReviewMsg',
      desc: '',
      args: [],
    );
  }

  /// `نشر الإعلان`
  String get publishAd {
    return Intl.message('نشر الإعلان', name: 'publishAd', desc: '', args: []);
  }

  /// `بالنشر، أنت توافق على شروط الخدمة`
  String get agreeToTermsPublishing {
    return Intl.message(
      'بالنشر، أنت توافق على شروط الخدمة',
      name: 'agreeToTermsPublishing',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message('نعم', name: 'yes', desc: '', args: []);
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message('إلغاء', name: 'cancel', desc: '', args: []);
  }

  /// `هل أنت متأكد أنك تريد تسجيل الخروج؟`
  String get logoutConfirmation {
    return Intl.message(
      'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `تحديد الكل كمقروء`
  String get markAllAsRead {
    return Intl.message(
      'تحديد الكل كمقروء',
      name: 'markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message('الإشعارات', name: 'notifications', desc: '', args: []);
  }

  /// `منذ`
  String get ago {
    return Intl.message('منذ', name: 'ago', desc: '', args: []);
  }

  /// `ساعة`
  String get hour {
    return Intl.message('ساعة', name: 'hour', desc: '', args: []);
  }

  /// `ساعات`
  String get hours {
    return Intl.message('ساعات', name: 'hours', desc: '', args: []);
  }

  /// `يوم`
  String get day {
    return Intl.message('يوم', name: 'day', desc: '', args: []);
  }

  /// `يومين`
  String get twoDays {
    return Intl.message('يومين', name: 'twoDays', desc: '', args: []);
  }

  /// `أيام`
  String get days {
    return Intl.message('أيام', name: 'days', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
