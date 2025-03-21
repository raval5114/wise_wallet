import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wise_wallet/Data/user.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/repos/PaymentProcess.dart';

part 'payment_processing_event.dart';
part 'payment_processing_state.dart';

class PaymentProcessingBloc
    extends Bloc<PaymentProcessingEvent, PaymentProcessingState> {
  PaymentProcessingBloc() : super(PaymentProcessingInitial()) {
    on<PaymentProcessingEvent>(_payViaNumber);
  }

  Future<void> _payViaNumber(PaymentProcessingEvent event,
      Emitter<PaymentProcessingState> emit) async {
    debugPrint("Processing Payment: ${event.data}");

    // Validate input data
    if (event.data['mobile number'] == null || event.data['amount'] == null) {
      emit(PaymentProcessErrorState(errorMessage: "Invalid payment details."));
      return;
    }

    emit(PaymentProcessLoadingstate());

    try {
      await PaymentProcessService.payViaNumber(
        fromNumber: '9574035114',
        toNumber: event.data['mobile number'],
        amount: event.data['amount'],
      );
      debugPrint("payment done successfully");
      emit(PaymentProcessSuccessState(data: event.data));
    } catch (e) {
      debugPrint("Payment Error: $e");
      emit(PaymentProcessErrorState(errorMessage: e.toString()));
    }
  }
}
