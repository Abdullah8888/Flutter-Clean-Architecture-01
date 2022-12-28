import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_phones_app/data/repository/smart_phones_repository.dart';
import 'package:smart_phones_app/domain/entities/smart_phone.dart';
import 'package:smart_phones_app/domain/usecases/get_smart_phones.dart';

class MockSmartPhoneRepository extends Mock implements SmartPhoneRepository {}

void main() {
  late GetSmartPhonesUseCase useCase;
  late MockSmartPhoneRepository mockSmartPhoneRepository;
  final sampleSmartPhones = makeSampleSmartPhones();

  setUp(() {
    mockSmartPhoneRepository = MockSmartPhoneRepository();
    useCase = GetSmartPhonesUseCase(repository: mockSmartPhoneRepository);
  });

  test(
    'This test the behaviour that allows to fetch smart phones from the repository',
    () async {
      // arrange
      when(mockSmartPhoneRepository.getSmartPhones())
          .thenAnswer((_) async => Right(sampleSmartPhones));

      // act
      final result = await useCase.execute();

      // assert
      expect(result, Right(sampleSmartPhones));
      verify(mockSmartPhoneRepository.getSmartPhones());
      verifyNoMoreInteractions(mockSmartPhoneRepository);
    },
  );
}

List<SmartPhone> makeSampleSmartPhones() {
  return const [
    SmartPhone(description: '', id: 1, title: 'Samsung'),
    SmartPhone(description: 'dd', id: 2, title: 'Samsudng'),
  ];
}
