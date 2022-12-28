import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_phones_app/data/datasources/remote_datasource.dart';
import 'package:smart_phones_app/data/repository/smart_phones_repository.dart';
import 'package:smart_phones_app/domain/usecases/get_smart_phones.dart';
import 'package:smart_phones_app/presentation/smart_phone_cubit.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => SmartPhoneCubit(usecase: locator()));

  //remote data source
  locator.registerFactory(() => RemoteDataSourceImpl(client: locator()));

  // usecase
  locator.registerLazySingleton(
      () => GetSmartPhonesUseCase(repository: locator()));

  // repository
  locator.registerLazySingleton<SmartPhoneRepository>(
    () => SmartPhoneRepositoryImpl(remoteDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
}
