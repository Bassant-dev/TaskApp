
abstract class TaskEvent {}

class FetchCalendarEvents extends TaskEvent {}

class TaskState {
  final List<String> events; // Replace String with your event data type

  TaskState({required this.events});
}