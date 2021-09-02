import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/shared/shared_helper.dart';
import 'package:try_bloc/views/splash/states.dart';
import 'package:try_bloc/views/timer/states.dart';

class SplashCubit extends Cubit<SplashStates>{
  SplashCubit() : super(SplashInit());
  static SplashCubit of(context)=>BlocProvider.of(context);

    checkIdExist(){
    if(  SharedHelper.containsId()) {
      emit(Logged());
    }else
      emit(NotLogged());

  }


}