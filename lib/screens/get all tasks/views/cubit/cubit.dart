import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:tasks_app_errasoft/screens/get%20all%20tasks/views/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/get%20all%20tasks/views/cubit/states.dart';

import '../../../../core/dio_helper.dart';
import '../../views_model/task_model.dart';

class GetAllTasksCubit extends Cubit<GetAllTasksState> {
  GetAllTasksCubit() : super(GetAllTasksInitial());
  List<TasksModel>tasks=[];
  getAllTasks()async
  {
    tasks=[];
    emit(GetAllTasksLoading());
    try {
      Response response=  await DioHelper.getData(url:'/task/index',);
      response.data['data'].forEach((item){
        tasks.add(TasksModel.fromJson(item));
      });
      print('tasks get Successfully');
      emit(GetAllTasksSuccess());

    } on Exception catch (e)
    {
      print(e.toString());
      emit(GetAllTasksFailure());
    }
  }
}