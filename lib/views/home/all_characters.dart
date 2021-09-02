import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/home/cubit.dart';
import 'package:try_bloc/views/home/states.dart';

class AllCharacters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = HomeCubit.of(context);

    return BlocBuilder(
        bloc: controller,
        builder: (context, state) => state is HomeLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: controller.charactersList.length,
                itemBuilder: (context, index) {
                  final char = controller.charactersList[index];
                  return Row(
                    children: [Container(width: MediaQuery.of(context).size.width/2, child: Image.network(char.img)), Text(char.name)],
                  );
                }));
  }
}
