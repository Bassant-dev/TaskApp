


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

import '../../../../core/model/model_login.dart';

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
      emit(AddNewUserLoadingState());
      DioHelper.postData(
        token: "${CacheHelper.getData(key:'token')}",
           url: "/user/store",
          data: {
        'name': name,
        'email':email,
        'phone':phone,
        'password': password,
        'user_type':1,

      }).then((value){
        print(value.data);
        print("success");
        emit(AddNewUserSuccessState());
      }).catchError((errror){
        emit(AddNewUserErrorState ());
        if(errror is DioException){
          print("nn");
        }
        if(errror is DioError && errror.response?.statusCode==422){
          final e = errror.response?.data;
          final m = e["message"];
          print(e);
          print(m);
        }
        print(errror.toString());
        print("errorrrrr");
      });




  }



  List<dynamic>users=[];
  Future getAllUsers()async
  {
    users=[];
    emit(GetAllUserStateLoading());
    try {
      Response  data=await  DioHelper.getData(url: '/user/index',token: CacheHelper.getData(key:'token'));
      data.data['data'].forEach((item){
        users.add(AllUserModel.fromJson(item));
      });
      print(users.length);
      print("b + m");
      emit(GetAllUserStateSuccess());

    } on Exception catch (e) {
      emit(GetAllUserStateFail());

    }

  }


}
