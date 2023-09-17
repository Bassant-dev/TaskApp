

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/api.dart';
import 'package:tasks_app_errasoft/core/cache_helper.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/states.dart';


class CubitDep extends Cubit< DepStates > {
  CubitDep() : super(InitialState());
  static CubitDep get(context) => BlocProvider.of<CubitDep>(context);


  final Dio dio = Dio();

  void NameDep( String name,) async {
    emit(LoadingStateDep());
     DioHelper.postData(
          url: 'department/store',
          token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rhc2tzYXBwLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk0OTUzMDY3LCJleHAiOjE2OTQ5NTY2NjcsIm5iZiI6MTY5NDk1MzA2NywianRpIjoiV0gxUnBIazAwbTYxbGtTRCIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.HtZUUsHVfniNTDn41ClM0ymhg3Fv-aF8Aok6eehaveA",
          data: {
            'name':name,
          },
      ).then((value){
        print(value);
        emit(DepSuccessState());
    }).catchError((error){
      print(error.toString());
      if(Dio is DioException){
        emit(DepErrorState());
      }
    });




  }



}
