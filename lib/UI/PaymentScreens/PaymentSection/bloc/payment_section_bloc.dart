import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wise_wallet/UI/PaymentScreens/PaymentSection/repos/paymentSectionRepo.dart';

part 'payment_section_event.dart';
part 'payment_section_state.dart';

class PaymentSectionBloc
    extends Bloc<PaymentSectionEvent, PaymentSectionState> {
  PaymentSectionBloc() : super(PaymentSectionInitial()) {
    on<PaymentSectionContactSearchingEvent>((event, emit) async {
      try {
        emit(PaymentSectionContactSearchingLoadingState());
        List<Map<String, dynamic>> numberList =
            await PaymentSectionRepo.getContactInfo(event.number);

        emit(PaymentSectionContactSearchingSuccessState(data: numberList));
      } catch (e) {
        emit(PaymentSectionErrorState(error: e.toString()));
      }
    });
  }
}
