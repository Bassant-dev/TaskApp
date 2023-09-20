import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/dio_helper.dart';
import '../../../../core/model/model_login.dart';
import 'employee_states.dart';


class GetAllDepartmentsCubit extends Cubit<GetAllDepartmentsState> {
  GetAllDepartmentsCubit() : super(GetAllDepartmentsInitial());
  List<DepartmentDataModel>departments=[];
  Future getAllDepartments()async
  {
    departments=[];
    emit(GetAllDepartmentsLoading());
    try {
      Response  data=await  DioHelper.getData(url: '/department/index');
      data.data['data'].forEach((item){
        departments.add(DepartmentDataModel.fromJson(item));
      });
      emit(GetAllDepartmentsSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(GetAllDepartmentsFailure());
      // TODO
    }

  }
}
