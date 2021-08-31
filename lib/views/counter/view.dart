import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/views/counter/cubit.dart';
import 'package:try_bloc/views/counter/states.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final controller = CounterCubit.of(context);

            return Scaffold(
              appBar: AppBar(
                title: Text("Counter"),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text("+"),
                      onPressed: controller.plus,
                    ),
                    Text("${controller.counter}"),
                    ElevatedButton(
                      child: Text("-"),
                      onPressed: controller.minus,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
