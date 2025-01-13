import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_page_event.dart';
part 'card_page_state.dart';

class CardPageBloc extends Bloc<CardPageEvent, CardPageState> {
  CardPageBloc() : super(CardPageInitial()) {
    on<CardPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
