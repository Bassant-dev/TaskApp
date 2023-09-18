import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/api.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/model/model_login.dart';


class CubitTask extends Cubit<TaskStates> {
  CubitTask() : super(LoginInitialState());


  final Dio dio = Dio();

  static CubitTask get(context) => BlocProvider.of<CubitTask>(context);

  LoginModel? loginModel;
  bool ischeck = false;
  void checkis(value) {
    ischeck = value;
    emit(CheckSuccess());
  }
  void login(String email, String password) async {
    emit(LoginLoadingState());


    dio.post(

        ApiConst.login,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),

      ).then((value) {
        print(value.data['data']['token']);
        print(value);
        CacheHelper.saveData(key: 'token', value:value.data['data']['token']);
        print("bassant");
        print(CacheHelper.getData(key: "token"));

        print("bassant");
        emit(LoginSuccessState(''));
      }).catchError((error) {
        print(error.toString());
        if (Dio is DioException) {
          emit(LoginErrorState());
        }
      });





  }
  void logout()async {
    try {
      print("basanttttt");
      print(CacheHelper.getData(key: 'token'));

      await DioHelper.postData(url: "/auth/logout", data: {},token:CacheHelper.getData(key: 'token') ,);
      emit(LogoutSuccessful());
    } catch (e) {
print(e.toString());
      emit(Logoutfail());
    }
  }
}







