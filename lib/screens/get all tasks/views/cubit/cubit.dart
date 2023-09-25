import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/screens/get%20all%20tasks/views/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/get%20all%20tasks/views/cubit/states.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';
import '../../../update_task/modeltask.dart';
import '../../views_model/task_model.dart';

class GetAllTasksCubit extends Cubit<GetAllTasksState> {
  GetAllTasksCubit() : super(GetAllTasksInitial());
  static GetAllTasksCubit get(context) => BlocProvider.of<GetAllTasksCubit>(context);

  List<TasksModel>tasks=[];
  List<UpdateTaskModel>updates=[];
  getAllTasks()async
  {
    tasks=[];
    updates=[];
  emit(GetAllTasksLoading());
  try {
  Response response=  await DioHelper.getData(url: '/task/index',token: CacheHelper.getData(key: "token"));
  response.data['data'].forEach((item){
  updates.add(UpdateTaskModel.fromJson(item));
  tasks.add(TasksModel.fromJson(item));


  });
  print('tasks get Successfully');
  emit(GetAllTasksSuccess());

  } on Exception catch (e)
    {

    print(e.toString());
    if(e is DioError && e.response?.statusCode==401){
      final error = e.response?.data;
      final m = error["message"];
      print(error);
      print(m);
    }
    emit(GetAllTasksFailure());
    }
  }
}