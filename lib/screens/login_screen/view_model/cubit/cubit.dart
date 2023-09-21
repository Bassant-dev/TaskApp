import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/api.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/view/Home_screen.dart';

import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/new_department/views/widget/get_all_department.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/model/model_login.dart';
import '../../../getemployee/get_employee.dart';
import '../../../new_department/views/widget/new_department_body.dart';


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
// Modify the login function to accept the context parameter
  void login(BuildContext context, String email, String password) async {
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
      if (value.data['data']['user_type'] == 'admin') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GetAllDepView(),
          ),
        );
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>GetEmployessDepartment(),
          ),
        );
      }
      print(value);
      CacheHelper.saveData(key: 'token', value: value.data['data']['token']);
      print("bassant");
      print(CacheHelper.getData(key: "token"));
      print("bassant");
      emit(LoginSuccessState(''));
    }).catchError((error) {
      print(error.toString());
      if (error is DioError) {
        emit(LoginErrorState());
      }
    });
  }

// Inside your build method, pass the context to the login function

  void logout()async {
      print("basanttttt");
      await DioHelper.postData(
        url: "/auth/logout",
        data: {},
        token:CacheHelper.getData(key: 'token') ,
      ).then((value){
        print(value.data);
        emit(LogoutSuccessful());
      }).catchError((errror){
        print(errror.toString());
        emit(Logoutfail());
      });

  }
}







