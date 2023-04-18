import 'package:course/models/login/counter/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<counterStates> // عايز Slass واحد
{
  CounterCubit() : super(ConterInitialState());

  // CounterCubit cubit = BlocProvider.of(context);

  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 1;

  minus() {
    counter--;
    emit(ConterMinusState());
  }

  plus() {
    counter++;
    emit(ConterPlusState());
  }
}
