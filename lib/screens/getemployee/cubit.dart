import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasks_app_errasoft/screens/getemployee/states.dart';

import '../../core/cache_helper.dart';
import '../../core/dio_helper.dart';
import '../../core/model/model_login.dart';



class GetEmployeesDepartmentCubit extends Cubit<GetEmployeesDepartmentState> {
  GetEmployeesDepartmentCubit() : super(GetEmployeesDepartmentInitial());
  static GetEmployeesDepartmentCubit get(context) => BlocProvider.of<GetEmployeesDepartmentCubit>(context);
  List<AllUserModel>employeesDepartment=[];
  getAllEmployeesDepartment()async
  {
    employeesDepartment=[];
    emit(GetEmployeesDepartmentLoading());
    try {
      Response response=  await DioHelper.getData(url: '/user/show-employees',token:  CacheHelper.getData(key: "token"));
      response.data['data'].forEach((item){
        employeesDepartment.add(AllUserModel.fromJson(item));
      });
      print('emp department get Successfully');
      emit(GetEmployeesDepartmentSuccess());

    } on Exception catch (e)
    {
      if(e is DioError && e.response?.statusCode==401){
        final error = e.response?.data;
        final m = error["message"];
        print(error);
        print(m);
      }
      print(e.toString());
      emit(GetEmployeesDepartmentFailure());
    }
  }



}