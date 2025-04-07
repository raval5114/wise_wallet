import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wise_wallet/Data/models/payment.dart';
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

    final String? toNumber = event.data['mobile number']?.toString();
    final int? amount = int.tryParse(event.data['amount'].toString());

    // Input validation
    if (toNumber == null || amount == null) {
      emit(PaymentProcessErrorState(errorMessage: "Invalid payment details."));
      return;
    }

    if (amount <= 0) {
      emit(PaymentProcessErrorState(
          errorMessage: "Amount must be greater than zero."));
      return;
    }

    if (userSession.mobile == toNumber) {
      emit(PaymentProcessErrorState(
          errorMessage: "Cannot send payment to yourself."));
      return;
    }

    emit(PaymentProcessLoadingstate());

    try {
      if (await PaymentProcessService.payViaSpecificBank(
          fromNumber: payment.fromNumber,
          toNumber: payment.toNumber,
          fromBank: payment.fromBank,
          toBank: payment.toBank,
          amount: payment.amount)) {
        emit(PaymentProcessSuccessState(data: event.data));
      }
    } catch (e) {
      debugPrint("Payment Error: $e");
      emit(PaymentProcessErrorState(errorMessage: e.toString()));
    }
  }
}
