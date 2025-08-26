import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_sign_up_event.dart';
part 'wallet_sign_up_state.dart';

class WalletSignUpBloc extends Bloc<WalletSignUpEvent, WalletSignUpState> {
  WalletSignUpBloc() : super(WalletSignUpInitial()) {
    on<WalletPageSignupEvent>((event, emit) async {
      emit(WalletSignupLoadingState());
      try {
        await Future.delayed(Duration(seconds: 5));
        emit(WalletSignupSuccessfullState());
      } catch (e) {
        emit(WalletSignupErrorMsg(errMsg: e.toString()));
      }
    });
  }
}
