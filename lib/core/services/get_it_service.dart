import 'package:carco/core/services/api_helper.dart';
import 'package:carco/features/add_car/data/datasources/add_car_remote_data_source.dart';
import 'package:carco/features/add_car/data/repositories/add_car_repository.dart';
import 'package:carco/features/add_car/data/repositories/add_car_repository_impl.dart';
import 'package:carco/features/add_car/presentation/cubit/add_car_cubit.dart';
import 'package:carco/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:carco/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:carco/features/auth/data/repositories/auth_repository.dart';
import 'package:carco/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:carco/features/car_details/data/datasources/car_details_remote_data_source.dart';
import 'package:carco/features/car_details/data/repositories/car_details_repository.dart';
import 'package:carco/features/car_details/data/repositories/car_details_repository_impl.dart';
import 'package:carco/features/edit_car/data/datasources/edit_car_remote_data_source.dart';
import 'package:carco/features/edit_car/data/repositories/edit_car_repository.dart';
import 'package:carco/features/edit_car/data/repositories/edit_car_repository_impl.dart';
import 'package:carco/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:carco/features/favorites/data/repositories/favorites_repository.dart';
import 'package:carco/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:carco/features/home/data/datasources/home_remote_data_source.dart';
import 'package:carco/features/home/data/repositories/home_repository.dart';
import 'package:carco/features/home/data/repositories/home_repository_impl.dart';
import 'package:carco/features/home/presentation/cubit/home_cubit.dart';
import 'package:carco/features/notifications/data/datasources/notifications_remote_data_source.dart';
import 'package:carco/features/notifications/data/repositories/notifications_repository.dart';
import 'package:carco/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:carco/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:carco/features/profile/data/repositories/profile_repository.dart';
import 'package:carco/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:carco/features/requests/data/datasources/requests_remote_data_source.dart';
import 'package:carco/features/requests/data/repositories/requests_repository.dart';
import 'package:carco/features/requests/data/repositories/requests_repository_impl.dart';
import 'package:carco/features/requests/presentation/cubit/requests_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ApiHelper(sl<Dio>()));
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<ApiHelper>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl<AuthLocalDataSource>(),
      remoteDataSource: sl<AuthRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<AddCarRemoteDataSource>(
    () => AddCarRemoteDataSourceImpl(sl<ApiHelper>()),
  );

  sl.registerLazySingleton<AddCarRepository>(() => AddCarRepositoryImpl(sl()));

  sl.registerFactory(() => AddCarCubit(sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => MockProfileRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
  );
  sl.registerLazySingleton<NotificationsRemoteDataSource>(
    () => MockNotificationsRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(sl<NotificationsRemoteDataSource>()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl<ApiHelper>()),
  );
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerFactory(() => HomeCubit(sl()));

  sl.registerLazySingleton<CarDetailsRemoteDataSource>(
    () => CarDetailsRemoteDataSourceImpl(sl<ApiHelper>()),
  );
  sl.registerLazySingleton<CarDetailsRepository>(
    () => CarDetailsRepositoryImpl(sl<CarDetailsRemoteDataSource>()),
  );
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => MockFavoritesRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(sl<FavoritesRemoteDataSource>()),
  );

  sl.registerLazySingleton<MyCarsRemoteDataSource>(
    () => MyCarsRemoteDataSourceImpl(sl<ApiHelper>()),
  );
  sl.registerLazySingleton<MyCarsRepository>(() => MyCarsRepositoryImpl(sl()));
  sl.registerFactory(() => MyCarsCubit(sl()));
  sl.registerLazySingleton<EditCarRemoteDataSource>(
    () => EditCarRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<EditCarRepository>(
    () => EditCarRepositoryImpl(sl<EditCarRemoteDataSource>()),
  );
}
