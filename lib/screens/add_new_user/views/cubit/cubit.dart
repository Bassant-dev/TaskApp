

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/api.dart';
import 'package:tasks_app_errasoft/core/cache_helper.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/core/model/model_login.dart';
import 'package:tasks_app_errasoft/screens/add_new_user/views/cubit/state.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/states.dart';


class CubitNewUser extends Cubit< AddNewUserStates > {
  CubitNewUser() : super( InitialStateAdd());
  static CubitNewUser get(context) => BlocProvider.of<CubitNewUser>(context);
  final Dio dio = Dio();
  UserModel? user;
  void selectOption(String option) {
    emit(RadioCubitSelectedadd(option));
  }

  Future<void> addUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String choosetype,

  }) async {
    try {
      emit(AddNewUserLoadingState());
      final apiUrl = ApiConst.newuser;
      final userData = {
        'name': name,
        'email':email,
        'phone': phone,
        'password': password,
        'user_type':'1'

      };
      final response = await dio.post(apiUrl, data: userData);
      emit(AddNewUserSuccessState());
      if (response.statusCode == 201) {
        emit(AddNewUserSuccessState());
      } else {
        emit(AddNewUserErrorState ());
        print("errorrrrr");
      }
    } catch (e) {
      print(e.toString());
      emit(AddNewUserErrorState ());
    }
  }



}
