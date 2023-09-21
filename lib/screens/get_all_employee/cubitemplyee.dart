import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app_errasoft/screens/get_all_employee/statesemployee.dart';

import '../../core/cache_helper.dart';
import '../../core/dio_helper.dart';
import '../../core/model/model_login.dart';


class GetAllEmployeesCubit extends Cubit<GetAllEmployeesState> {
  GetAllEmployeesCubit() : super(GetAllEmployeesInitial());
  static GetAllEmployeesCubit get(context) => BlocProvider.of<GetAllEmployeesCubit>(context);
  List<AllUserModel>employees=[];
  Set<AllUserModel>filteredEmployees={};
  Future<List<AllUserModel>> getAllEmployees()async
  {
    employees=[];
    filteredEmployees={};
    try {
      Response  data=await  DioHelper.getData(url: '/user/show-employees',token: CacheHelper.getData(key: "token"));
      data.data['data'].forEach((item){
        employees.add(AllUserModel.fromJson(item));
      });
      for(int i=0;i<employees.length;i++)
      {
        filteredEmployees.add(employees[i]);
      }
      print(employees.length);
      emit(GetAllEmployeesSuccess());
    } on Exception catch (e)
    {
      if(e is DioError && e.response?.statusCode==401){
        final error = e.response?.data;
        final m = error["message"];
        print(error);
        print(m);
      }
      emit(GetAllEmployeesFailures());
      print(e.toString());

    }
    return employees;

  }
  dynamic valueChoose;
  late int id;

  assignEmployee(value)
  {
    valueChoose=value;
    emit(AddDropDownSuccess());
  }
  clearEmployees()
  {
    employees=[];
    emit(ClearListSuccess());
  }
}

