
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/cache_helper.dart';
import 'package:tasks_app_errasoft/core/dio_helper.dart';
import 'package:tasks_app_errasoft/screens/update_department/view_model/cubit/state.dart';

import '../../../add_new_user/views/cubit/state.dart';


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
  void deleteDepartment(int ?departmentId){
    emit(DeleteDepLoadingState());
    DioHelper.deleteData(
      url: "/department/delete/$departmentId",

      token: CacheHelper.getData(key: "token"),
    ).then((value) {
      print(value);
      emit(DeleteDepSuccessState());
    }).catchError((errror){
      print(errror);
      if(errror is DioError && errror.response?.statusCode==422){
        final e = errror.response?.data;
        final m = e["message"];
        print(e);
        print(m);
      }
      emit(DeleteDepErrorState ());
    });
  }


}
