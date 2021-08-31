import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit of(context)=> BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> loginAndSignup(String method)async{
    if(!formKey.currentState.validate()) return;
    emit(LoginLoading());

      final formData = ({
        'email': emailController.text,
        'password': passwordController.text
      });

    try{
      final response = await Dio().post('https://identitytoolkit.googleapis.com/v1/accounts:$method?key=AIzaSyBjb3KDPB9yEV6Nh8QaC8eeG1Qq9TA1Djo',data: formData);
      final data = response.data as Map;
      if(data.containsKey('message'))

      emit(ShowSnack());

      else

      emit(GoToHome());

    }catch(e, s){
      print(e);
      /// Dio Error 500
      print(s);
      /// Line 50 file login_view.dart
    }
    emit(LoginInit());
  }


}