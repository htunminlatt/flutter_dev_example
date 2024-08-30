import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'newtest_event.dart';
part 'newtest_state.dart';

class NewtestBloc extends Bloc<NewtestEvent, NewtestState> {
  NewtestBloc() : super(NewtestInitial()) {
    on<NewtestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
