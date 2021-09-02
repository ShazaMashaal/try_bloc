import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/home/all_characters.dart';
import 'package:try_bloc/views/home/cubit.dart';
import 'package:try_bloc/views/home/states.dart';

class CharactersList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
        create: (context) {
         return HomeCubit()..getData();

        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Characters"),
          ),
          body: AllCharacters(),

        ));
  }
}
