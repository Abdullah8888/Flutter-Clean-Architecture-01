import 'package:dartz/dartz.dart';
import 'package:smart_phones_app/core/failure.dart';
import 'package:smart_phones_app/data/repository/smart_phones_repository.dart';
import 'package:smart_phones_app/domain/entities/smart_phone.dart';

class GetSmartPhonesUseCase {
  final SmartPhoneRepository repository;

  GetSmartPhonesUseCase({required this.repository});

  Future<Either<HttpFailure, List<SmartPhone>>> execute() async {
    return await repository.getSmartPhones()!;
  }

  Future<Either<HttpFailure, Product>> execute2() async {
    return await repository.getSmartPhones2()!;
  }
}
