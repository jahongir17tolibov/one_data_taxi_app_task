import 'package:get_it/get_it.dart';
import 'package:one_data_taxi_app_task/feature/main/domain/repository/address_repository.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    ..registerLazySingleton<AddressRepository>(AddressRepository.new)
    ..registerFactory<HomeBloc>(() => HomeBloc(repository: getIt<AddressRepository>()));
}
