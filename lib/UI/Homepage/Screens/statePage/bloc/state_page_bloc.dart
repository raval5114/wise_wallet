import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'state_page_event.dart';
part 'state_page_state.dart';

class StatePageBloc extends Bloc<StatePageEvent, StatePageState> {
  StatePageBloc() : super(StatePageInitial()) {
    on<StatePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
