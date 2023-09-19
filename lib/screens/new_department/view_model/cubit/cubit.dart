

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
          url: '/department/store',
          data: {
            'name':name,
          },
       token: CacheHelper.getData(key: "token"),
      ).then((value){
        print(value);
        emit(DepSuccessState());
    }).catchError((error){
       if(error is DioError && error.response?.statusCode==401){
         final e = error.response?.data;
         final m = e["message"];
         print(e);
         print(m);
       }
      print(error.toString());
      if(Dio is DioException){
        emit(DepErrorState());
      }
    });




  }



}
