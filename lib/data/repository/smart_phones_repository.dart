import 'package:dartz/dartz.dart';
import 'package:smart_phones_app/core/failure.dart';
import 'package:smart_phones_app/data/datasources/local_datasource.dart';
import 'package:smart_phones_app/data/datasources/remote_datasource.dart';
import 'package:smart_phones_app/domain/entities/smart_phone.dart';

abstract class SmartPhoneRepository {
  Future<Either<HttpFailure, List<SmartPhone>>>? getSmartPhones();
  Future<Either<HttpFailure, Product>>? getSmartPhones2();
}

class SmartPhoneRepositoryImpl implements SmartPhoneRepository {
  final RemoteDataSource remoteDataSource;

  SmartPhoneRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<HttpFailure, List<SmartPhone>>>? getSmartPhones() async {
    try {
      final result = await remoteDataSource.getSmartPhones();
      return Right(result);
    } catch (e) {
      return Left(HttpFailure('LOLO error'));
    }
  }

  @override
  Future<Either<HttpFailure, Product>>? getSmartPhones2() async {
    try {
      final result = await remoteDataSource.getSmartPhones2();
      return Right(result);
    } catch (e) {
      return Left(HttpFailure('LOLO product error'));
    }
  }
}

// class SmartPhoneRepositoryImpl implements SmartPhoneRepository {
//   final RemoteDataSource remoteDataSource;
//   final LocalDataSource localDataSource;

//   SmartPhoneRepositoryImpl(
//       {required this.remoteDataSource, required this.localDataSource});

//   @override
//   Future<Either<HttpFailure, List<SmartPhone>>>? getSmartPhones() {
//     // TODO: implement getSmartPhones
//     throw UnimplementedError();
//   }
// }
