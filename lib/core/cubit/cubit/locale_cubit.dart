import 'package:carco/core/constants.dart';
import 'package:carco/core/helper/shared_preferences_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super('ar') {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final savedLocale =
        await SharedPreferencesService.getData(key: Constants.localizations) ??
        'ar';

    emit(savedLocale);
  }

  Future<void> changeLocale(String locale) async {
    await SharedPreferencesService.saveData(
      key: Constants.localizations,
      value: locale,
    );
    emit(locale);
  }
}
