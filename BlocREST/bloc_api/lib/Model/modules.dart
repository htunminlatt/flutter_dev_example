import 'package:bloc_api/Bloc/get/cubit/get_about_cubit.dart';
import 'package:bloc_api/Data/respsitory.dart';
import 'package:bloc_api/Model/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.I;
void Locator() {
  Dio _dio = Dio();
  getIt.registerLazySingleton(() => _dio);

  Apiservice apiservice = Apiservice(getIt.call());
  getIt.registerLazySingleton(() => apiservice);

  Repository repository = Repository(apiservice: getIt.call());
  getIt.registerLazySingleton(() => repository);

  GetAboutCubit getAboutCubit = GetAboutCubit(getIt.call());
  getIt.registerLazySingleton(() => getAboutCubit);
}
