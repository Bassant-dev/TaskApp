//
//
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasks_app_errasoft/screens/addNewTask/view/cubit/states.dart';
//
// import '../../../../core/cache_helper.dart';
// import '../../../../core/dio_helper.dart';
//
// class CubitAddNewTask extends Cubit<AddNewTaskStates > {
//   CubitAddNewTask() : super( InitialStateAddNewTask());
//   static CubitAddNewTask get(context) => BlocProvider.of<CubitAddNewTask>(context);
//   Future<void> addNewTask( {
//     required String name,
//     required String description,
//      String? status,
//     String ?start_date,
//     String ?end_date,
//
//
//   }) async {
//     emit(LoadingStateAddNewTask());
//     DioHelper.postData(
//         token: "${CacheHelper.getData(key:'token')}",
//         url: "/task/store",
//         data: {
//           'name': name,
//           'description':description,
//           'status': 0,
//           'start_date': '2024/01/01',
//           'end_date':'2024/01/01',
//           'employee_id':4,
//
//         }).then((value){
//       print(value.data);
//       print("success");
//       emit(AddNewTaskSuccessState());
//     }).catchError((errror){
//       emit(AddNewTaskErrorState ());
//       if(errror is DioException){
//         print("nn");
//       }
//       if(errror is DioError && errror.response?.statusCode==422){
//         final e = errror.response?.data;
//         final m = e["message"];
//         print(e);
//         print(m);
//       }
//       print(errror.toString());
//       print("errorrrrr");
//     });
//
//
//
//
//   }
//
//
//
// }
import 'package:bloc/bloc.dart';

import 'package:tasks_app_errasoft/screens/addNewTask/view/cubit/states.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';
import '../../view_model/task_model.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  AddNewTaskCubit() : super(AddNewTaskInitial());
  addNewTask(CreateTaskModel model)async
  {
    try {
      await DioHelper.postData(data:{
        'name':model.name,
        'description':model.description,
        'status':model.status,
        'start_date':model.startDate,
        'end_date':model.endDate,
        'employee_id':model.employeeId
      } ,url:'/task/store' ,token: CacheHelper.getData(key: "token"),
           );
      print('add new task to employee successfully');
      emit(AddNewTaskSuccess());
    } on Exception catch (e) {
      emit(AddNewTaskFailure());
      // TODO
    }
  }
  dynamic valueChoose;
  late int id;

  assignEmployee(value)
  {
    valueChoose=value;
    emit(ChangedAssignedEmployeeSuccess());
  }
}
