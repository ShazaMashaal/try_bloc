import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/login/LoginConfirmButton.dart';
import 'package:try_bloc/views/login/cubit.dart';
import 'package:try_bloc/views/login/login_fields.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Icon(Icons.phone,size: 100),
            LoginFields(),
            LoginConfirmButton(),
          ],
        ),
      ),
    );
  }
}