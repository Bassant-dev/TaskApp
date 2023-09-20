import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app_errasoft/screens/addNewTask/view/cubit/statesemployee.dart';
import '../../../../core/dio_helper.dart';
import '../../../../core/model/model_login.dart';


class GetAllEmployeesCubit extends Cubit<GetAllEmployeesState> {
  GetAllEmployeesCubit() : super(GetAllEmployeesInitial());
  List<AllUserModel>employees=[];
  Set<AllUserModel>filteredEmployees={};
  Future getAllEmployees()async
  {
    employees=[];
    try {
      Response  data=await  DioHelper.getData(url: '/user/show-employees');
      data.data['data'].forEach((item){
        employees.add(AllUserModel.fromJson(item));
        filteredEmployees.add(AllUserModel.fromJson(item));
      });
      emit(GetAllEmployeesSuccess());

    } on Exception catch (e) {
      emit(GetAllEmployeesFailures());
      print(e.toString());
      // TODO
    }

  }
}