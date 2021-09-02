import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/shared/bloc_observer.dart';
import 'package:try_bloc/shared/shared_helper.dart';
import 'package:try_bloc/views/splash/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
