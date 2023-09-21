import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:tasks_app_errasoft/screens/update_task/states_task.dart';

import '../../core/cache_helper.dart';
import '../../core/dio_helper.dart';
import 'modeltask.dart';


class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitial());
  updateTask(UpdateTaskModel model,empId) async {
    try {
      Response response = await DioHelper.postData(
          url: '/task/update/${model.id}',
          data: {
            'name': model.taskName,
            'description': model.description,
            'status': '0',
            'start_date': model.startDate,
            'end_date': model.endDate,
            'employee_id': empId
          },
         token: CacheHelper.getData(key: 'token'));
      print(response.data['message']);
      emit(UpdateTaskSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(UpdateTaskFailure());
    }
  }
}