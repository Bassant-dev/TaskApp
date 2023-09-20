import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:tasks_app_errasoft/screens/getemployee/states.dart';

import '../../core/dio_helper.dart';
import '../../core/model/model_login.dart';



class GetEmployeesDepartmentCubit extends Cubit<GetEmployeesDepartmentState> {
  GetEmployeesDepartmentCubit() : super(GetEmployeesDepartmentInitial());
  List<AllUserModel>employeesDepartment=[];
  getAllEmployeesDepartment()async
  {
    employeesDepartment=[];
    emit(GetEmployeesDepartmentLoading());
    try {
      Response response=  await DioHelper.getData(url: '/user/show-employees',);
      response.data['data'].forEach((item){
        employeesDepartment.add(AllUserModel.fromJson(item));
      });
      print('emp department get Successfully');
      emit(GetEmployeesDepartmentSuccess());

    } on Exception catch (e)
    {
      print(e.toString());
      emit(GetEmployeesDepartmentFailure());
    }
  }
}