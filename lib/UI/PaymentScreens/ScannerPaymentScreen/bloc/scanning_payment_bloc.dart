import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:wise_wallet/Data/models/payment.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentProccesingScreen/repos/PaymentProcess.dart';

part 'scanning_payment_event.dart';
part 'scanning_payment_state.dart';

class ScanningPaymentBloc
    extends Bloc<ScanningPaymentEvent, ScanningPaymentState> {
  ScanningPaymentBloc() : super(ScanningPaymentInitial()) {
    on<ScanningEvent>((event, emit) async {
      emit(ScanningPaymentLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));

        await PaymentProcessService.payViaNumber(
          amount: payment.amount,
          fromNumber: payment.fromNumber,
          toNumber: payment.toNumber,
        );

        emit(ScanningPaymentSuccess());
      } catch (e) {
        emit(ScanningPaymentError(e.toString()));
      }
    });
  }
}
