import 'package:bloc/bloc.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/view_model/states.dart';

class HomeCubit extends Cubit<TaskState> {
  HomeCubit() : super(TaskState(events: []));

  void fetchCalendarEvents() {

    final events = ['Event 1', 'Event 2', 'Event 3'];
    emit(TaskState(events: events));
  }


}