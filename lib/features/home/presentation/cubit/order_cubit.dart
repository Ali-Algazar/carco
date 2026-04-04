import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/api_helper.dart';
import '../../data/models/order_params.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}

class OrderCubit extends Cubit<OrderState> {
  final ApiHelper apiHelper;
  OrderCubit(this.apiHelper) : super(OrderInitial());

  Future<void> createOrder(OrderParams params) async {
    emit(OrderLoading());
    try {
      await apiHelper.post(
        '/orders/create',
        data: params.toJson(),
        requiresAuth: true,
      );
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
