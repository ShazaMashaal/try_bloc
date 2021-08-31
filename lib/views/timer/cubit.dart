import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/timer/states.dart';

class TimerCubit extends Cubit<TimerStates>{
  TimerCubit() : super(TimerCount());
  static TimerCubit of(context)=>BlocProvider.of(context);
  int counter=3;



}