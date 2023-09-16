import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/api.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';


class CubitTask extends Cubit<TaskStates> {
  CubitTask() : super(LoginInitialState());


  final Dio dio = Dio();

  static CubitTask get(context) => BlocProvider.of<CubitTask>(context);

  void login(String email, String password) async {

    emit(LoginLoadingState());

    try {
      final response = await dio.post(
        ApiConst.login,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState());
    }
  }
  bool ischeck=false;
 void checkis(value){
    ischeck=value;
    emit(CheckSuccess());
  }
}
