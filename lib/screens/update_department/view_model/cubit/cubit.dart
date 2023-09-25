
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/cache_helper.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/screens/update_department/view_model/cubit/state.dart';

import '../../../add_new_user/views/cubit/state.dart';
import '../../../new_department/view_model/cubit/cubit.dart';
import '../../../new_department/views/widget/get_all_department.dart';


class CubitUpdateDep extends Cubit<UpdateDepStates > {
  CubitUpdateDep() : super( InitialStateUpdateDep());
  static CubitUpdateDep get(context) => BlocProvider.of< CubitUpdateDep>(context);


  void updateDepartment(int ?departmentId,{required String name}){
    emit(LoadingStateUpdateDep());
    DioHelper.postData(
        url: "/department/update/$departmentId",
        data: {
      'name':name,
       },
    token: CacheHelper.getData(key: "token"),
    ).then((value) {
      print(value);
      emit(UpdateDepSuccessState());

    }).catchError((errror){
      if(errror is DioError && errror.response?.statusCode==401){
        final e = errror.response?.data;
        final m = e["message"];
        print(e);
        print(m);
      }
      emit(UpdateDepErrorState());
    });
  }
  void deleteDepartment(int ?departmentId,context){
    emit(DeleteDepLoadingState());
    DioHelper.deleteData(
      url: "/department/delete/$departmentId",

      token: CacheHelper.getData(key: "token"),
    ).then((value) {
      print(value);
      emit(DeleteDepSuccessState());
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Deleted Successfully"),
            duration: Duration(seconds: 2), // Duration for which the toast will be displayed
          ));
      CubitDep.get(context).getAllDepartments();


    }).catchError((errror){

      print(errror);
      if(errror is DioError && errror.response?.statusCode==422){
        final e = errror.response?.data;
        final m = e["message"];
        print(e);
        print(m);
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("cannot delete department because have emplyees"),
            duration: Duration(seconds: 2), // Duration for which the toast will be displayed
          ));

      emit(DeleteDepErrorState ());


    });
  }


}
