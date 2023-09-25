

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
import 'package:tasks_app_errasoft/screens/update_user_details/views/cubit/state.dart';




class CubitUpdateUserDetails extends Cubit<UpdateUserDetailsStates > {
  CubitUpdateUserDetails() : super( InitialStateUpdateUserDetails());
  static CubitUpdateUserDetails get(context) => BlocProvider.of<CubitUpdateUserDetails>(context);
  void selectOption(String option) {
    emit(RadioCubitSelected(option));
  }
  Future<void> updateuserdetails(int ?userId,{
    required String name,
    required String email,
    required String phone,
    required String userType,
    required String userStatus,

  })async{
emit(LoadingStateUpdateUserDetails());
DioHelper.postData(
    url: "/user/update/$userId",
    token: CacheHelper.getData(key: "token"),
    data: {
      'name':name,
      'email':email,
      'phone':phone,
      'user_status':userStatus,
      'user_type':userType,
    }).then((value) {
  emit(UpdateUserDetailsSuccessState());





}).catchError((errror){
  emit(UpdateUserDetailsErrorState());
});
}



}
