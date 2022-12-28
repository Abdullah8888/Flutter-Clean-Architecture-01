import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_phones_app/domain/usecases/get_smart_phones.dart';

import '../domain/entities/smart_phone.dart';

class SmartPhoneCubit extends Cubit<SmartPhoneState> {
  final GetSmartPhonesUseCase usecase;
  SmartPhoneCubit({required this.usecase}) : super(SmartPhoneLoading());

  Future<void> getSmartPhones() async {
    emit(const SmartPhoneHasError("just started"));
    try {
      final result = await usecase.execute2();
      if (result.isRight()) {
        result.fold((failure) {
          emit(const SmartPhoneHasError("error"));
        }, (data) => {emit(SmartPhoneHasResponse2(data))});
      } else {
        emit(const SmartPhoneHasError('af'));
      }
    } catch (ee) {
      emit(SmartPhoneHasError(ee.toString()));
    }
  }
}

abstract class SmartPhoneState extends Equatable {
  const SmartPhoneState();

  @override
  List<Object?> get props => [];
}

class SmartPhoneLoading extends SmartPhoneState {}

class SmartPhoneHasResponse extends SmartPhoneState {
  final List<SmartPhone> smartPhones;
  const SmartPhoneHasResponse(this.smartPhones);
}

class SmartPhoneHasResponse2 extends SmartPhoneState {
  final Product products;
  const SmartPhoneHasResponse2(this.products);
}

class SmartPhoneHasError extends SmartPhoneState {
  final String message;
  const SmartPhoneHasError(this.message);
}
