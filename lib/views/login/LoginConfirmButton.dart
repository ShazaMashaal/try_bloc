
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/counter/view.dart';
import 'package:try_bloc/views/login/cubit.dart';
import 'package:try_bloc/views/login/states.dart';
import 'package:try_bloc/views/timer/view.dart';

class LoginConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = LoginCubit.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) =>
      state is LoginLoading
          ? CupertinoActivityIndicator()
          : ElevatedButton(
        onPressed:() {  controller.loginAndSignup("signInWithPassword");
        if(state is ShowSnack) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
        }
        else{
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounterView()));
        }
        },
        child: Text('Login'),
      ),
    );
  }
}