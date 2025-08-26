import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_sign_up_event.dart';
part 'wallet_sign_up_state.dart';

class WalletSignUpBloc extends Bloc<WalletSignUpEvent, WalletSignUpState> {
  WalletSignUpBloc() : super(WalletSignUpInitial()) {
    on<WalletSignUpEvent>((event, emit) async {
      emit(WalletSignupLoadingEvent());
      try {
        await Future.delayed(Duration(seconds: 5));
        emit(WalletSignupSuccessfullState());
      } catch (e) {
        emit(WalletSignupErrorMsg(errMsg: e.toString()));
      }
    });
  }
}
