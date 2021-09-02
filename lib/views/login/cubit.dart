import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/shared/shared_helper.dart';
import 'package:try_bloc/views/counter/view.dart';
import 'package:try_bloc/views/home/view.dart';
import 'package:try_bloc/views/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInit());

  static LoginCubit of(context)=> BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> loginAndSignup(String method,contxt)async{
    if(!formKey.currentState.validate()) return;
    emit(LoginLoading());

      final formData = ({
        'email': emailController.text,
        'password': passwordController.text
      });

    try{
      final response = await Dio().post('https://identitytoolkit.googleapis.com/v1/accounts:$method?key=AIzaSyBjb3KDPB9yEV6Nh8QaC8eeG1Qq9TA1Djo',data: formData,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              })
              );
      final data = response.data as Map;
      if(data.containsKey('message'))

        ScaffoldMessenger.of(contxt).showSnackBar(
            SnackBar(content: Text('Error!')));
      else{
        SharedHelper.setId(data["idToken"]);
        Navigator.push(
          contxt,
          MaterialPageRoute(builder: (context) => CharactersList()));
      }


    }catch(e, s){
      print(e);
      /// Dio Error 500
      print(s);
      /// Line 50 file login_view.dart
    }
    emit(LoginInit());
  }


}