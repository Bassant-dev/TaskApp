

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/api.dart';
import 'package:tasks_app_errasoft/core/cache_helper.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/screens/add_new_user/views/cubit/state.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/update_department/view_model/cubit/state.dart';


class CubitUpdateDep extends Cubit<UpdateDepStates > {
  CubitUpdateDep() : super( InitialStateUpdateDep());
  static CubitUpdateDep get(context) => BlocProvider.of< CubitUpdateDep>(context);

  void updateDepartment(int ?departmentId){
    emit(LoadingStateUpdateDep());
    DioHelper.postData(
        url: "/department/update/$departmentId",
        data: {
      'name':'name',
    }).then((value) {
      emit(UpdateDepSuccessState());
    }).catchError((errror){
      emit(UpdateDepErrorState());
    });
  }

}
