import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_bloc/consts/strings.dart';
import 'package:try_bloc/views/home/model.dart';
import 'package:try_bloc/views/home/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  List<Character> charactersList = [];

  Future<void> getData() async {
    emit(HomeLoading());

    BaseOptions options = BaseOptions(
      baseUrl: BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    Dio dio = Dio(options);
    try {
      Response response = await dio.get("characters");
      final data = response.data as List;
      print(data);
      data.forEach((element) {
        Character character = Character.fromJson(element);
        charactersList.add(character);
      });
    } catch (e, s) {
      print(e);
      print(s);
    }

    emit(HomeInit());
  }
}
