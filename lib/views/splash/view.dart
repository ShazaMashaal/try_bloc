import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/home/view.dart';
import 'package:try_bloc/views/login/view.dart';
import 'package:try_bloc/views/splash/states.dart';

import 'cubit.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashCubit(),
        child: Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<SplashCubit, SplashStates>(
                  builder: (context, state) {
                    if(state is Logged)
                      return CharactersList();
                    else
                      return LoginView();

                  }),
            ),
          ),
        ));
  }
}
